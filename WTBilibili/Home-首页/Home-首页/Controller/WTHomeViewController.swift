//
//  WTHomeViewController.swift
//  WTBilibili
//
//  Created by 无头骑士 GJ on 16/5/3.
//  Copyright © 2016年 无头骑士 GJ. All rights reserved.
//  首页控制器

import UIKit

class WTHomeViewController: UIViewController
{
    // MARK: - 懒加载
    /// 标题工具栏
    let toolBarView = UIView()
    
    let contentView = UIScrollView()

    // MARK: - 系统回调函数
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // 1、设置UI
        setupUI()
        
        // 2、设置所有子控制器
        setupAllChildViewControllers()
        
        // 3、设置标题
        setupAllTitle()
    }
}

// MARK: - 自定义函数
extension WTHomeViewController
{
    // MARK: 设置UI
    private func setupUI()
    {
        // 1、添加标题工具栏
        toolBarView.frame = self.navigationController!.navigationBar.bounds
        navigationController?.navigationBar.addSubview(toolBarView)
        
        // 2、设置内容滚动视图
        view.addSubview(contentView)
        contentView.frame = CGRect(x: 0, y: 0, width: WTScreenWidth, height: WTScreenHeight)
        contentView.delegate = self
    }
    
    // MARK: - 设置所有子控制器
    private func setupAllChildViewControllers()
    {
        // 1、直播
        setupOneChildViewController(WTLiveViewController(), title: "直播")
        // 2、推荐
        setupOneChildViewController(WTRecommendViewController(), title: "推荐")
        // 3、番剧
        setupOneChildViewController(WTSomeDramaViewController(), title: "番剧")
        // 4、分类
        setupOneChildViewController(WTCategoryViewController(), title: "分区")
    }
    
    // MARK: - 设置一个子控制器
    private func setupOneChildViewController(viewController: UIViewController, title: String)
    {
        viewController.title = title
        addChildViewController(viewController)
    }
    
    // MARK: - 设置标题
    private func setupAllTitle()
    {
        let count = childViewControllers.count
        
        var x: CGFloat = 0
        let y: CGFloat = 0
        let w: CGFloat = 80
        let h = toolBarView.bounds.height
        for i in 0..<count
        {
            x = CGFloat(i) * w;
            let viewController = childViewControllers[i]
            
            // 1、创建按钮
            let btn = UIButton(type: .Custom)
            
            btn.frame = CGRect(x: x, y: y, width: w, height: h)
            toolBarView.addSubview(btn)
            
            // 2、设置按钮属性
            btn.tag = i
            btn.setTitle(viewController.title, forState: .Normal)
            btn.setTitleColor(WTColor(r: 153, g: 153, b: 153), forState: .Normal)
            btn.setTitleColor(WTColor(r: 251, g: 114, b: 153), forState: .Highlighted)
            btn.setTitleColor(WTColor(r: 251, g: 114, b: 153), forState: .Selected)
            btn.addTarget(self, action: #selector(titleBtnClick), forControlEvents: .TouchUpInside)
        }
    }
}

// MARK: - 事件处理
extension WTHomeViewController
{
    // 标题按钮点击
    @objc private func titleBtnClick()
    {
        print("titleBtnClick")
    }
}

// MARK: - UIScrollViewDelegate
extension WTHomeViewController: UIScrollViewDelegate
{

}
