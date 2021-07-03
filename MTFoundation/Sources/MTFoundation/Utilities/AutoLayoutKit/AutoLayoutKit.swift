//
//  AutoLayoutKit.swift
//  
//
//  Created by Murilo Teixeira on 29/06/21.
//

import UIKit

public class AutoLayoutKit {
    
    init(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.view = view
    }
    
    private unowned let view: UIView
    
    public private(set) lazy var leading = Pin<XAnchor>(view: view, origin: .leading)
    public private(set) lazy var trailing = Pin<XAnchor>(view: view, origin: .trailing)
    public private(set) lazy var centerX = Pin<XAnchor>(view: view, origin: .center)
    
    public private(set) lazy var top = Pin<YAnchor>(view: view, origin: .top)
    public private(set) lazy var bottom = Pin<YAnchor>(view: view, origin: .bottom)
    public private(set) lazy var centerY = Pin<YAnchor>(view: view, origin: .center)
    
    public private(set) lazy var width = Size(view: view, origin: .width)
    public private(set) lazy var height = Size(view: view, origin: .height)
    
    public private(set) lazy var center = Center(view: view)
    
    public private(set) lazy var edgeX = Edge(view: view, edgeAnchor: .horizontal)
    public private(set) lazy var edgeY = Edge(view: view, edgeAnchor: .vertical)
    public private(set) lazy var edge = Edge(view: view, edgeAnchor: .all)
}
