CREATE TABLE IF NOT EXISTS
    meal(
        id int AUTO_INCREMENT PRIMARY KEY,
        day date,
        meal_time_zone varchar(100),
        protein int,
        sugar_content int,
        lipid int,
        vitamin int,
        mineral int
    );

CREATE TABLE IF NOT EXISTS
    users(
        id int AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) not null,
        password VARCHAR(50) not null
    );

-- userテーブル
-- ユーザを登録するテーブル
CREATE TABLE IF NOT EXISTS
    user(
        user_id serial primary key, -- ユーザID
        login_id char(16) NOT NULL, -- ログインID
        user_name char(16) NOT NULL, --　ユーザー名
        password char(16) NOT NULL, --　パスワード
        email char(16) NOT NULL, -- Eメール
        profile char(255) NOT NULL DEFAULT "なし", -- プロフィール
        profile_img char(255) NOT NULL DEFAULT "なし", --　プロフィール画像
        --　タイムスタンプ
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
        updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

-- lankingテーブル
-- ユーザーがランキングを作成するためのテーブル
-- ユーザとは１｜Nの関係
CREATE TABLE IF NOT EXISTS 
    lanking(
        lanking_id serial primary key, -- ランキングID
        user_id BIGINT unsigned, -- ユーザID
        lanking_title char(16) NOT NULL, --　ランキングのタイトル
        lanking_content char(16) NOT NULL, --　ランキングの概要
        lanking_img char(255) NOT NULL DEFAULT "なし", --　ランキングのサムネイル画像
        comment_key char(16) NOT NULL, --　コメント許可パスワード
        delete_password char(16) NOT NULL, --ランキングの削除パスワード
        --　タイムスタンプ
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --
        updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,--
        --
        FOREIGN KEY fk_user(user_id) REFERENCES user(user_id) --　ユーザがなければランキングは作れない
);

-- lanking_commentテーブル
-- ランキングに対してつけられるコメントを格納する
-- ユーザ及びランキングとは１｜Nの関係
CREATE TABLE IF NOT EXISTS 
    lanking_comment(
        lanking_comment_id serial primary key, -- ランキングコメントID
        lanking_id BIGINT unsigned, -- ユーザID
        user_id BIGINT unsigned, --
        lanking_comment char(16) NOT NULL, --
        --
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --
        updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        --
        Foreign Key fk_lanking(lanking_id) REFERENCES lanking(lanking_id),--　ランキングが無ければコメントはつけられない
        Foreign Key fk_user(user_id) REFERENCES user(user_id)--　ユーザーがいなければコメントはつけられない
);

-- lanking_lank
-- ランキング内で各項目へ振り分けるランクを定義
-- ランキングとは1|Nの関係
CREATE TABLE IF NOT EXISTS 
    lanking_lank(
        lanking_lank_id serial primary key,
        lanking_id BIGINT unsigned, -- ユーザID
        lanking_lank char(16) NOT NULL, --
        lanking_lank_img char(255) NOT NULL DEFAULT "なし", --
        -- 
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --
        updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        --
        Foreign Key fk_lanking(lanking_id) REFERENCES lanking(lanking_id)--
);
-- lanking_item
-- ランキングのランク付対象を格納する
-- ランキングとは1|Nの関係
CREATE TABLE IF NOT EXISTS
    lanking_item(
        lanking_item serial primary key,
        lanking_id BIGINT unsigned, -- ユーザID
        lanking_item_name char(16) NOT NULL, --
        lanking_item_img char(255) NOT NULL DEFAULT "なし", --
        lanking_lank_id BIGINT unsigned,
        -- 
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --
        updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        --
        Foreign Key fk_lanking(lanking_id) REFERENCES lanking(lanking_id) --
);
-- lanking_tag
-- ランキングにつけられるタグを格納する
-- ランキングとはN｜Nの関係となる
CREATE TABLE IF NOT EXISTS
    lanking_tag(
        lanking_tag_id serial primary key,
        lanking_tag_name char(16) NOT NULL, -- ユーザID
        --
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --
        updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- taggings
-- ランキングとランキングタグを紐付けする交差テーブル
CREATE TABLE IF NOT EXISTS
    taggings(
        lanking_id BIGINT unsigned, 
        lanking_tag_id BIGINT unsigned, -- ユーザID
        --
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --
        updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        --
        Foreign Key fk_lanking(lanking_id) REFERENCES lanking(lanking_id), --
        Foreign Key fk_lanking_tag(lanking_tag_id) REFERENCES lanking_tag(lanking_tag_id) --
);

-- -- godwil
-- -- ランキングに対していいねをつけたことを格納する
-- -- lanking_idとuser_idによる複合キー
CREATE TABLE IF NOT EXISTS
    godwil(
        lanking_id BIGINT unsigned,
        user_id BIGINT unsigned, -- ユーザID
        --
        created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, --
        updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        --
        Foreign Key fk_user(user_id) REFERENCES lanking(user_id), --
        Foreign Key fk_lanking(lanking_id) REFERENCES lanking(lanking_id) --
);

