#Useage
  ```
  let rect = CGRectMake(80, 300, 200, 50)
  ShimmeringView = TEShimmeringView(frame: rect)
  self.view.addSubview(ShimmeringView)
  let button = UIButton(frame: ShimmeringView.bounds)
  button.setTitle("TEShimmering", forState: UIControlState.Normal)
  btnShimmeringView.contentView = button
  btnShimmeringView.setShimmeringSpeed(0)
  ```
