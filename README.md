# NewsAPI-Swift
Swift code for NewsAPI.org

## How to use it


```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let key = "YOUR-newsapi.org-KEY"
        let nam = NewsAPIManager() // Initialize News API Manager

        nam.getArticles(source: .CNN, key: key){response in // Getting articles from CNN
            print(response) // String response of JSON
        }
        
        return true
}
```
