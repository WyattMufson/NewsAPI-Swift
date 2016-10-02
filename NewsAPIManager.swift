//
//  NewsAPIManager.swift
//
//  Created by Wyatt Mufson on 10/2/16.
//  Copyright © 2016 Wyatt Mufson. All rights reserved.
//

import Foundation

enum NewsSources : String {
    case AustralianBroadcastCorporation = "abc-news-au"
    case ArsTechnica = "ars-technica"
    case AP = "associated-press"
    case BBC = "bbc-news"
    case BBCSport = "bbc-sport"
    case Bild = "bild"
    case Bloomberg = "bloomberg"
    case BusinessInsider = "business-insider"
    case BusinessInsiderUK = "business-insider-uk"
    case BuzzFeed = "buzzfeed"
    case CNBC = "cnbc"
    case CNN = "cnn"
    case DailyMail = "daily-mail"
    case Engadget = "engadget"
    case EntertainmentWeekly = "entertainment-weekly"
    case ESPN = "espn"
    case ESPNCricInfo = "espn-cric-info"
    case FinancialTimes = "financial-times"
    case Focus = "focus"
    case FootballItalia = "football-italia"
    case Fortune = "fortune"
    case FourFourTwo = "four-four-two"
    case FoxSports = "fox-sports"
    case Google = "google-news"
    case GruenderSzene = "gruender-szene"
    case HackerNews = "hacker-news"
    case IGN = "ign"
    case Independent = "independent"
    case Mashable = "mashable"
    case Metro = "metro"
    case Mirror = "mirror"
    case MTVNews = "mtv-news"
    case MTVNewsUK = "mtv-news-uk"
    case NatGeo = "national-geographic"
    case NewScientist = "new-scientist"
    case NewsWeek = "newsweek"
    case NewYorkMagazine = "new-york-magazine"
    case NFLNews = "nfl-news"
    case Polygon = "polygon"
    case Recode = "recode"
    case Reddit = "reddit-r-all"
    case Reuters = "reuters"
    case SkyNews = "sky-news"
    case SkySportsNews = "sky-sports-news"
    case SpiegelOnline = "spiegel-online"
    case t3n = "t3n"
    case TalkSport = "talksport"
    case TechCrunch = "techcrunch"
    case TechRadar = "techradar"
    case TheEconomist = "the-economist"
    case TheGuardianAU = "the-guardian-au"
    case TheGuardianUK = "the-guardian-uk"
    case TheHindu = "the-hindu"
    case HuffPo = "the-huffington-post"
    case TheLadBible = "the-lad-bible"
    case NTY = "the-new-york-times"
    case TNW = "the-next-web"
    case TheSportBible = "the-sport-bible"
    case TheTelegraph = "the-telegraph"
    case TheTimesOfIndia = "the-times-of-india"
    case TheVerge = "the-verge"
    case WSJ = "the-wall-street-journal"
    case TheWatshingtonPost = "the-washington-post"
    case Time = "timet"
    case USA = "usa-today"
    case Wired = "wired-de"

}

class NewsAPIManager: NSObject {
    
    func getArticles(source:NewsSources, key:String, completionHandler: @escaping (Data) -> ()) {
        
        let site = "https://newsapi.org/v1/articles?source=\(source.rawValue)&sortBy=top&apiKey=\(key)"
        let url = URL(string: site)
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, err in
            
            if (err != nil) {
                completionHandler(Data())
            } else {
                completionHandler(data!)
            }
            
            
            
            }.resume()
        
    }
    
}
