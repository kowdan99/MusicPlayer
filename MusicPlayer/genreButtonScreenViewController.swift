import UIKit
import MediaPlayer
class genreButtonScreenViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    @IBAction func genreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
                self.playGenre(genre: sender.currentTitle!)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String){
        musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        query.addFilterPredicate(predicate)
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
