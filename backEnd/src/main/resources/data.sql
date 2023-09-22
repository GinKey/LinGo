CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- �������� ������� "user" ��� �������� ���������� � �������������
CREATE TABLE "user" (
                        id uuid DEFAULT Uuid_generate_v4 () PRIMARY KEY,
                        name VARCHAR(255),
                        email VARCHAR(255) not null,
                        password VARCHAR(255) not null,
                        description text
);

CREATE TABLE UsersLanguages(
                               id serial primary key,
                               user_id uuid REFERENCES "user"(id) on delete cascade,
                               language uuid REFERENCES language(id)
);

CREATE TABLE language(
                         id uuid PRIMARY KEY,
                         name VARCHAR(32)
);

-- CREATE TABLE deletedChats(
--                              id serial primary key,
--                              user_id uuid REFERENCES "user"(id) on delete cascade,
--                              chat_id uuid REFERENCES chat(id) on delete restrict
-- );

-- �������� ������� "chat" ��� �������� ���������� � �����
CREATE TABLE chat (
                      id uuid DEFAULT Uuid_generate_v4 () PRIMARY KEY,
                      user1_id uuid REFERENCES "user"(id) on delete restrict,
                      user2_id uuid REFERENCES "user"(id) on delete restrict
);


-- �������� ������� "message" ��� �������� ���������� � ��������� ����������
CREATE TABLE message (
                         id uuid DEFAULT Uuid_generate_v4 () PRIMARY KEY,
                         user_id uuid REFERENCES "user"(id) on delete restrict,
                         chat_id uuid REFERENCES chat(id) on delete restrict,
                         message_text text,
                         create_date timestamp,
                         status varchar(32)
);

-- �������� ������� "files" ��� �������� ���������� � ������, ������������� � ����������
-- CREATE TABLE files (
--                        id uuid PRIMARY KEY,
--                        message_id INT REFERENCES message(id),
--                        file_ Varchar(255)
-- );
