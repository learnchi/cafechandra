-- データベースの作成
CREATE DATABASE cafechandra DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 管理画面ログインユーザーテーブルの作成
CREATE TABLE users (  
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,  
    login_id VARCHAR(16) NOT NULL,  
    password_hash VARCHAR(255) NOT NULL,  
    user_name VARCHAR(40) NOT NULL,  
    permissions VARCHAR(50),  
    created_at DATETIME NOT NULL,  
    created_by VARCHAR(16) NOT NULL,  
    updated_at DATETIME,  
    updated_by VARCHAR(16),  
    PRIMARY KEY (id),  
    UNIQUE KEY (login_id)  
);

-- お知らせ記事用テーブルの作成
CREATE TABLE news (  
    id INT UNSIGNED AUTO_INCREMENT NOT NULL,  
    title VARCHAR(100) NOT NULL,  
    body TEXT NOT NULL,  
    published_at DATE NOT NULL,  
    is_published BOOLEAN NOT NULL DEFAULT TRUE,  
    created_at DATETIME NOT NULL,  
    created_by VARCHAR(16) NOT NULL,  
    updated_at DATETIME,  
    updated_by VARCHAR(16),  
    PRIMARY KEY (id)  
);

-- sサンプルデータの挿入
INSERT INTO `news` (`id`, `title`, `body`, `published_at`, `is_published`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES 
(NULL, '新しいケーキセットが登場しました', 'このたび、新しいケーキセットの提供を開始いたしました。\r\n季節のフルーツを使用したケーキと、当店自慢のコーヒーの組み合わせをお楽しみいただけます。\r\n\r\n午後のひとときを、ゆったりとした時間とともにお過ごしください。\r\n数量限定のため、売り切れの際はご容赦ください。', '2026-04-05', '1', '2026-04-05 10:07:49.000000', 'admin', NULL, NULL), 
(NULL, 'ゴールデンウィーク営業のお知らせ', 'ゴールデンウィーク期間中は、通常通り営業いたします。\r\nなお、一部日程では営業時間が変更となる場合がございますので、ご来店の際はご注意ください。\r\n\r\n混雑が予想されるため、お時間に余裕を持ってお越しいただけますと幸いです。\r\n皆さまのご来店を心よりお待ちしております。', '2026-04-15', '1', '2026-04-15 10:07:49.000000', 'admin', NULL, NULL), 
(NULL, '春の限定「さくらブレンド」登場！', '春の訪れに合わせて、期間限定の「さくらブレンド」をご用意いたしました。\r\nほのかに甘い香りとやわらかな酸味が特徴の、季節を感じる一杯です。\r\n\r\n店内でゆっくりとお楽しみいただくのはもちろん、テイクアウトでもご提供しております。\r\n数量限定のため、なくなり次第終了となります。ぜひこの機会にお試しください。', '2026-04-20', '1', '2026-04-20 10:07:49.000000', 'admin', NULL, NULL);

INSERT INTO users (
    login_id,
    password_hash,
    user_name,
    permissions,
    created_at,
    created_by
) VALUES (
    'admin',
    'kokoniha_password_hash_no_modorichi_wo_iretekudasai.',
    '管理者',
    'news_list,news_create,news_edit,news_delete',
    NOW(),
    'SYSTEM'
);
