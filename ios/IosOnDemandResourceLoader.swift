import Foundation


@objc(IosOnDemandResourceLoader)
class IosOnDemandResourceLoader: NSObject {
    var request: NSBundleResourceRequest?

    @objc(loadResourcesByTag:resolver:rejecter:)
     func loadResourcesByTag(tag: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
        self.request?.endAccessingResources()

         self.request = NSBundleResourceRequest(tags: [tag])

         self.request?.conditionallyBeginAccessingResources(completionHandler: { (resourceAvailable) in
           DispatchQueue.main.async {
             if !resourceAvailable { // resource not available locally
               print("resource not available locally")
                 self.request!.beginAccessingResources { err in
                     guard err == nil else {
                        // an error occured while downloading
                        print("an error occured while downloading")
                        reject("err_while_downloading", "an error occured while downloading", err)
                        return
                    }

                    let path = Bundle.main.url(forResource: tag, withExtension: "zip")

                    self.request?.endAccessingResources()
                    resolve(path?.absoluteString)
                    return
                 }
             } else { // resource available locally
               print("resource available locally")
               let path = Bundle.main.url(forResource: tag, withExtension: "zip")

               self.request?.endAccessingResources()
               resolve(path?.absoluteString)
             }

           }
         })
    }

}
