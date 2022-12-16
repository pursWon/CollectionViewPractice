import UIKit

class ViewController: UIViewController {
    var colorArray: [UIColor] = [.green, .gray, .red, .systemTeal, .brown, .blue, .cyan, .purple, .black, .orange, .systemYellow, .systemIndigo, .systemMint, .lightGray]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
        CollectionViewCell else{ return UICollectionViewCell() }
        cell.colorView.backgroundColor = colorArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let lineCount: CGFloat = 3
        let interSpacing: CGFloat = 20
        let totalWidth = width - (interSpacing * (lineCount - 1))
        let itemSize: CGFloat = totalWidth / lineCount
        
        return CGSize(width: itemSize, height: itemSize)
    }
}

