# README

## Users

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| nickname            | string     | null: false, unique: true |
| email               | string     | null: false, unique: true |
| encrypted_password  | string     | null: false               |
| last_name           | string     | null: false               |
| first_name          | string     | null: false               |
| last_name_kana      | string     | null: false               |
| first_name_kana     | string     | null: false               |


### Association
- has_many :rooms
- has_many :characters
- has_many :comments

## Rooms

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| user     | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_many :characters
- has_many :comments

## Characters

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| personality | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| room        | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :room
- has_many :comments
- has_one :profile


## Profiles

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| age           | integer    |                                |
| sex_id        | integer    |                                |
| detail        | text       |                                |
| character     | references | null: false, foreign_key: true |

### Association
- belongs_to :character


## Comments

| Column     | Type       | Options                        |
| -----------| ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |
| character  | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :room
- belongs_to :comments


