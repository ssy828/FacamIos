import Foundation
let album:Dictionary<String,Any> =
    ["albumInfo":["albumTitle":"2집 Oh!",
                  "artist":"소녀시대",
                  "genre":"댄스"],
     "songList":[["songTitle":"Oh!",
                  "trackNum":1,
                  "artist":"소녀시대",
                  "writer":"김정배",
                  "playTime":12340,
                  "playURL":"http://music.naver.com/123"],
                 ["songTitle":"Show! Show! Show!",
                  "trackNum":2,
                  "artist":"소녀시대",
                  "writer":"김부민",
                  "playTime":10130,
                  "playURL":"http://music.naver.com/124"],
                 ["songTitle":"웃자 (Be Happy)",
                  "trackNum":4,
                  "artist":"소녀시대",
                  "writer":"이트라이브",
                  "playTime":12134,
                  "playURL":"http://music.naver.com/126"]
        ]
]
struct AlbumInfo
{
    var albumTitle: String
    var artist: String
    var genre: String
    
    init?(data: [String:Any])
    {
        guard let albumTitle = data["albumTitle"] as? String else {return nil}
        self.albumTitle = albumTitle // self: AlbumInfo의 인스턴스
        guard let artist = data["artist"] as? String else {return nil}
        self.artist = artist
        guard let genre = data["genre"] as? String else {return nil}
        self.genre = genre
    }
}
// 시간 단위: 초단위로 설정함
struct SongData
{
    var songTitle: String
    var trackNumber: Int
    var artist: String
    var writer: String
    var playTime: Int
    var playURL: String
    
    init?(data:[String:Any])
    {
        // 키값을 똑같이 쓰세요!
        guard let songTitle = data["songTitle"] as? String else {return nil}
        self.songTitle = songTitle // self :SongList의 인스턴스
        // trackNum으로 써야지 키값을 반환함! 입력받는 부분이 tarckNum으로 되어있기 때문에
        guard let trackNumber = data ["trackNum"] as? Int else {return nil}
        self.trackNumber = trackNumber
        guard let artist = data["artist"] as? String else {return nil}
        self.artist = artist
        guard let writer = data["writer"] as? String else {return nil}
        self.writer = writer
        guard let playTime = data["playTime"] as? Int else {return nil}
        self.playTime = playTime
        guard let playURL = data["playURL"] as? String else{return nil}
        self.playURL = playURL
        
    }
}

struct AlbumModel
{
    var albumInfo: AlbumInfo
    var songList: [SongData] = []
    
    // 파라미터: 새로운 인스턴스 만듦
    init?(dataDic: [String:Any])
    {// guard let: 꼭 값이 있어야해! 그래서 가져와야해!
        // if let: 값이 필요하지 않은 경우!
        // 데이터가 있어도 되고 없어도 되는 경우 사용!
        // 데이터가 있어도 되는건지 아닌 것인지 알아야함!
        guard let albumInfoDic = dataDic["albumInfo"] as? [String:Any] else {return nil}
        guard let albumInfo = AlbumInfo(data: albumInfoDic) else {return nil}
        self.albumInfo = albumInfo
        guard let songListArr = dataDic["songList"] as? [[String:Any]] else {return nil}
        // "songList"키를 통해서 값을 찾으면 그 값을 배열안에 딕셔너리를 갖는 songListArr에 할당
//        print(songListArr)
        for songDic in songListArr // songListArr배열에서 song을 빼옴
        {

            //           songList.append(songL)
            //            guard let
            //            guard let songData = data["SongData"] else {return nil}
            // 위는 데이터가 안맞음!
            //            guard let songData = SongData(data: song ) else {return nil}
            // 위에서 song을 넣은 이유: let song: [String : Any]
            // SongData의 초기값(파라미터: [String: Any])으로 지정해서!
            //            songList.append(SongData(data: song))
            if let songData = SongData(data: songDic)
            { // 값이 제대로 안 들어올 경우: 이곳 실행 안함
                self.songList.append(songData)
            }
        }
        
    }
}


