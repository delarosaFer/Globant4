import UIKit

//MARK: - Enum for storyboards identifiers
enum StoryboardName: String {
    case mainStoryboard = "Main"
}

//MARK: - Enum for view controllers identifiers
enum ViewControllerName: String {
    case datailViewController = "DetailViewController"
    case homeViewController = "HomeViewController"
}

//MARK: - Enum for cells identifiers
enum CellIdentifier: String {
    case workplaceCell = "WorkSpaceCell"
    case careerCell = "CareerCell"
}

//MARK: - Enum for alerts controllers
enum AlertString: String {
    case errorTittle = "errorTitle"
    case errorMessage = "errorMessaage"
    case okAction = "okAction"
}

//MARK: - Enum for dates
enum DateString: String {
    case from = "fromDate"
    case to = "toDate"
}

//MARK: - Enum for strings at networking errors
enum NetworkErrorKey: String {
    case invalidData = "invalidData"
    case unknown = "unknownNetworkError"
    case invalidUrl = "invalidUrl"
}

//MARK: - Enum for urls as strings
enum URLString: String {
    case wpl = "WPL_URL"
    case profilePicture = "https://cdn.appstorm.net/web.appstorm.net/files/2012/06/profile.jpg"
}

//MARK: - Enum for comments
enum Comment: String {
    //MARK: - Strings for dates
    case startDate = "Starting date"
    case endDate = "Ending date"
    
    //MARK: - Strings for alert controllers
    case alertMessage = "Alert default message"
    case alertError = "Alert error"
    case okAction = "Ok action"
    
    //MARK: - Network error
    case invalidData = "Data is invalid"
    case invalidUrl = "URL is invalid"
    case unknown = "Error unknowned"
}
