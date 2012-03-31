= Özetçe

Sırayla

1. auth: https://github.com/seyyah/auth-demo/tree/auth

> Authentication (Kimlik Denetimi; Doğrulama) işlemi bu aşamada yapılır.
> Bunun sayesinde `User` modeli üzerinden `login` desteği sağlanır.
> Giriş yapan kişiye blog üzerinde CRUD desteği verilir.

2. cancan: https://github.com/seyyah/auth-demo/tree/cancan

> CANCAN: Authorization (Yetkilendirme) işlemi bu aşamada yapılır.
> Bunun sayesinde kullanıcılar sadece kendi oluşturdukları bloglar
> üzerinde CRUD yapabilirler. Diğerlerini ise sadece okuyabilirler.

3. cancan-role: https://github.com/seyyah/auth-demo/tree/cancan-role

> Kullanıcılara role tanımlama bu aşamada gerçekleştirilir. Buna göre
> farklı yeteneklere sahip kullanıcılar tanımlanabilir. Örneğin:
> geek, moderator, admin, superadmin gibi. Bunlar sadece okuma (geek),
> okuma+oluşturma (moderator), okuma+oluşturma+düzenleme (admin) ve
> okuma+oluşturma+düzenleme+silme (superadmin) rollerinde ki kullanıcılardır.

dallarını takip edin. Ayrıntılar ilgili dalın Readme dosyasında yazılmıştır.
