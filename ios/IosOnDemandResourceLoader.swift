import Foundation

@objc(IosOnDemandResourceLoader)
class IosOnDemandResourceLoader: NSObject {
    var request: NSBundleResourceRequest?


    // fileName is the name of the file's ODR tag
    // if you want to download more than 1 file, change String to [String]
    @objc
    func loadResourcesByTag(tag: String, withResolver resolve: RCTPromiseResolveBlock, withRejecter reject: RCTPromiseRejectBlock) -> Void {
        guard self.request == nil else {return}

        self.request = NSBundleResourceRequest(tags: [tag])

        self.request?.conditionallyBeginAccessingResources(completionHandler: { (resourceAvailable) in
            if !resourceAvailable { //resource not available locally
                self.request!.beginAccessingResources { err in
                    guard err == nil else {
                        //an error occured while downloading
                        reject("err_while_downloading", "an error occured while downloading", err)
                        return
                    }
                    resolve("file_downloaded")
                    return
                }
            } else { //resource available locally
                resolve("available_locally")
            }
        })

    }

}
