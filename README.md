#Useage
  ```swift
  let rect = CGRectMake(80, 300, 200, 50)
  let shimmeringView = TEShimmeringView(frame: rect)
  self.view.addSubview(shimmeringView)
  let button = UIButton(frame: shimmeringView.bounds)
  button.setTitle("TEShimmering", forState: UIControlState.Normal)
  btnShimmeringView.contentView = button
  btnShimmeringView.setShimmeringSpeed(30)
  ```
  Demo apps
-----
  <p align="center">
<img style="-webkit-user-select: none;" src="https://github.com/tetupei/TEShimmering/blob/master/demo.gif" width="368" height="664">
</p>

