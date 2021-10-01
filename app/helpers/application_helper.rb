module ApplicationHelper
  def default_meta_tags
    {
      site: 'いらないモノ診断',
      description: '「実はいらないモノ」が見つかるアプリ',
      charset: 'utf-8',
      reverse: true,
      icon: [
        { href: image_url('logo.png'), type: 'image/png' },
        { href: image_url('logo.png'), rel: 'apple-touch-icon-precomposed', sizes: '32x32', type: 'image/png' }
      ],
      og: {
        site_name: :site,
        title: :site,
        type: 'website',
        description: '「実はいらないモノ」が見つかるアプリ',
        url: request.url,
        image: image_url('room.jpg'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        image: {
          _: image_url('room.jpg'),
          width: 300,
          height: 300
        }
      }
    }
  end

  def admin_url?
    request.url.include?('/admin')
  end
end
