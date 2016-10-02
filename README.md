# NewsAPI-Swift
Swift code for NewsAPI.org

**Written in Swift 3 for use with Xcode 8**

## How to use it


```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let key = "YOUR-newsapi.org-KEY"
        let nam = NewsAPIManager() // Initialize News API Manager

        nam.getArticles(source: .CNN, key: key){data in // Getting articles from CNN
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                if let jsonArray = json as? [String: AnyObject] {
                    if let articles = jsonArray["articles"] as? [[String : AnyObject]] {
                        for article in articles { // Get each article
                            print("\nArticle: \(article)\n")
                        }
                    }
                }
                
            } catch {
                print("error serializing JSON: \(error)")
            }
        }
        
        return true
}
```
