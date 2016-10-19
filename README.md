# NewsAPI-Swift
Swift Extension of the NewsAPI.org API used to get articles from a given news source in JSON format

**Written in Swift 3 for use with Xcode 8**

This is a free to use service for Swift using the NewsAPI.org API. This works by calling an HTTP GET request, passing a source (listed in the enum) and an API key (instructions below). Returns a JSON containing four fields: a status, a list of articles, a source, and a sortBy. If articles is non-nil, status will be "ok". Source will be the source that is passed and sortBy will be "top". 

Access the articles in the JSON with the "articles" field.

Article JSONs contain the following fields:
- author
- description
- publishedAt
- title
- url
- urlToImage

Fields are not guaranteed to be non-nil.

## Set Up

1) Go to https://newsapi.org

2) Click  "Get API Key" (or go to https://newsapi.org/register)

3) Include 'powered by' attribution link back to NewsAPI.org as part of free use agreement

## How to use it

This is an example of calling the `getArticles(source: _, key: _)` function to get all the top articles from CNN. Called in the `application didFinishLaunchingWithOptions` and stores the article in `UserDefaults` if it is not already there. Note that this is called asynchronously.

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let key = "YOUR-newsapi.org-KEY"
        let nam = NewsAPIManager() // Initialize News API Manager

        var currentArticles = UserDefaults.standard.object(forKey: "NewsAPI-Swift Articles")
        
        nam.getArticles(source: .CNN, key: key){data in // Getting articles from CNN
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                if let jsonArray = json as? [String: AnyObject] {
                    if let articles = jsonArray["articles"] as? [[String : AnyObject]] {
                        for article in articles { // Get each article
                            if !currentArticles.contains(article) {
                                currentArticles.append(article)
                            }
                        }
                        UserDefaults.standard.set(currentArticles, forKey: "NewsAPI-Swift Articles")
                    }
                }
                
            } catch {
                print("error serializing JSON: \(error)")
            }
        }
        
        return true
}
```
