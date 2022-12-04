delete from meal;

insert into meal
values (
        1,
        "2022-12-21",
        "朝食",
        2,
        3,
        5,
        1,
        5
    ), (
        2,
        "2022-12-21",
        "昼食",
        4,
        5,
        5,
        3,
        2
    ), (
        3,
        "2022-12-21",
        "夕食",
        2,
        5,
        5,
        2,
        3
    );

-- -- INSERT into users (username,password) VALUES ("TAROU","PASSWORD" );
INSERT IGNORE INTO
    user (
        user_id, -- ユーザID
        login_id, -- ログインID
        user_name, --　ユーザー名
        password, --　パスワード
        email, -- Eメール
        profile, -- プロフィール
        profile_img --　プロフィール画像
    ) 
    VALUES (
        1,
        "tsubasa0001",
        "つばさ",
        "123456",
        "tsubasa0221@example.com",
        "なし",
        "なし"
    );