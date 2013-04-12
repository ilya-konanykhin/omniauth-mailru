# OmniAuth Mail.ru

This gem contains the unofficial Mail.ru OAuth2 strategy for [OmniAuth](http://github.com/intridea/omniauth).

## Basic Usage

    Devise.setup do |config|
      config.omniauth :mailru, MAILRU_KEY, MAILRU_PRIVATE_KEY
    end

Callback url can be passed in order to match specified one on Mail.ru side in application preferences.

    Devise.setup do |config|
      config.omniauth :mailru, MAILRU_KEY, MAILRU_PRIVATE_KEY, :callback_url => "http://example.com/users/auth/mailru/callback"
    end

## Links

* http://api.mail.ru/docs/guides/oauth/

## Hash example

```
---
provider: mailru
uid: '12678929345635123456'
info:
  nickname: Иван Иванов
  email: ivanivanov@mail.ru
  name: Иван Иванов
  first_name: Иван
  last_name: Иванов
  image: 
  location: 
  urls:
    Mailru: http://my.mail.ru/mail/ivanivanov/
credentials:
  token: 3b813f2ed6b0097bfdf30b13181ac0a8
  refresh_token: 2516c1db5e9510ff745ea7a4a44bb100
  expires_at: 1365851632
  expires: true
extra:
  raw_info:
    pic_50: http://avt.appsmail.ru/mail/ivanivanov/_avatar50
    friends_count: 0
    pic_22: http://avt.appsmail.ru/mail/ivanivanov/_avatar22
    nick: Иван Иванов
    is_verified: 0
    is_online: 1
    pic_big: http://avt.appsmail.ru/mail/ivanivanov/_avatarbig
    last_name: Иванов
    has_pic: 0
    email: ivanivanov@mail.ru
    pic_190: http://avt.appsmail.ru/mail/ivanivanov/_avatar190
    referer_id: ''
    vip: 0
    pic_32: http://avt.appsmail.ru/mail/ivanivanov/_avatar32
    birthday: ''
    referer_type: ''
    link: http://my.mail.ru/mail/ivanivanov/
    last_visit: '1365764981'
    location:
      country:
        name: Россия
        id: '24'
      city:
        name: Москва
        id: '25'
      region:
        name: Москва
        id: '999999'
    uid: '12678929345635123456'
    app_installed: 1
    status_text: ''
    pic_128: http://avt.appsmail.ru/mail/ivanivanov/_avatar128
    sex: 0
    pic: http://avt.appsmail.ru/mail/ivanivanov/_avatar
    pic_small: http://avt.appsmail.ru/mail/ivanivanov/_avatarsmall
    pic_180: http://avt.appsmail.ru/mail/ivanivanov/_avatar180
    pic_40: http://avt.appsmail.ru/mail/ivanivanov/_avatar40
    first_name: Иван
```

## License

Copyright (c) 2011 by Victor Gumayunov, (c) 2013 by Semenyuk Dmitriy

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

