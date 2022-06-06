import Foundation

protocol Subject {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObserver(temperature: Float, humidity: Float, pressure: Float)
}

protocol Observer {
    var id : String { get set }
    func update(temperature: Float, humidity: Float, pressure: Float)
}

protocol DisplayElement {
    func display()
}

class WeatherData : Subject {
    
    private var observers: [Observer]
    private var temperature: Float
    private var humidity: Float
    private var pressure: Float
    
    public init(observers: [Observer] = [], temperature: Float, humidity: Float, pressure: Float) {
        self.observers = observers
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
    }
    
    func registerObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        if let index = observers.firstIndex(where: {$0.id == observer.id}) {
            observers.remove(at: index)
        }
    }
    
    func notifyObserver(temperature: Float, humidity: Float, pressure: Float) {
        observers.forEach { observer in
            observer.update(temperature: temperature, humidity: humidity, pressure: pressure)
        }
    }
}

struct News: Observer {
    var id: String = "News"
    
    func update(temperature: Float, humidity: Float, pressure: Float) {
        print("9 Clock New Weather forecase temp: \(temperature), humidity: \(humidity), pressure: \(pressure)")
    }
    
}

struct NaverWebSite: Observer {
    var id: String = "NaverWebSite"
    
    func update(temperature: Float, humidity: Float, pressure: Float) {
        print("Naver Weather forecase temp: \(temperature), humidity: \(humidity), pressure: \(pressure)")
    }
    
}

struct KakaoWeather: Observer {
    var id: String = "KakaoWeather"
    
    func update(temperature: Float, humidity: Float, pressure: Float) {
        print("KakaoWeather temp: \(temperature), humidity: \(humidity), pressure: \(pressure)")
    }
    
}

let news = News()
let naverWebsite = NaverWebSite()
let kakaoWeather = KakaoWeather()

var observers : [Observer] = [news, naverWebsite, kakaoWeather]

let weatherData = WeatherData(observers: observers ,temperature: 30.0, humidity: 13.0, pressure: 6.0)

weatherData.notifyObserver(temperature: 39.0, humidity: 17.0, pressure: 2.0)



