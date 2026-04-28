// =============================================================================
// 自定义脚本
// 此文件会在每篇文章和页面的末尾执行
// =============================================================================

(function () {
  'use strict';

  // 控制台欢迎信息
  console.log('%c☁️ 星云笔记', 'font-size: 24px; font-weight: bold; color: #5bbad5;');
  console.log('%c欢迎访问我的博客！', 'font-size: 14px; color: #666;');

  // 为外部链接添加安全属性（FixIt 已内置，此处为示例）
  document.querySelectorAll('a[href^="http"]').forEach(function (link) {
    if (!link.hasAttribute('target')) {
      link.setAttribute('target', '_blank');
      link.setAttribute('rel', 'noopener noreferrer nofollow');
    }
  });

  // 图片懒加载增强：添加淡入效果
  if ('IntersectionObserver' in window) {
    const imageObserver = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const img = entry.target;
          img.classList.add('loaded');
          imageObserver.unobserve(img);
        }
      });
    });

    document.querySelectorAll('img[loading="lazy"]').forEach((img) => {
      imageObserver.observe(img);
    });
  }
})();
