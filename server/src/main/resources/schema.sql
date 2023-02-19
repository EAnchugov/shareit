-- DROP ALL OBJECTS;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS items CASCADE;
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
                                     id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
                                     name VARCHAR(255) NOT NULL,
                                     email VARCHAR(512) NOT NULL,
                                     CONSTRAINT UQ_USER_EMAIL UNIQUE (email),
                                     CONSTRAINT pk_user PRIMARY KEY (id)

);

CREATE TABLE requests
(
    id          BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    description VARCHAR(555)                                 NOT NULL,
    user_id BIGINT NOT NULL,
    CONSTRAINT pk_requests PRIMARY KEY (id),
    CONSTRAINT fk_requests_user FOREIGN KEY (user_id) REFERENCES users ON DELETE CASCADE,
    created     TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE items(
                      id bigint generated by default as identity not null,
                      name varchar(555) not null,
                      description varchar(555) not null,
                      available varchar(555) not null,
                      owner bigint references USERS(id) on delete cascade,
                      request bigint,
                      CONSTRAINT pk_item PRIMARY KEY (id),
                      constraint fk_items_to_requestor foreign key (request) references requests(id)
);

CREATE TABLE bookings(
                         id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
                         start_time TIMESTAMP WITHOUT TIME ZONE,
                         end_time TIMESTAMP WITHOUT TIME ZONE,
                         item BIGINT references ITEMS(id),
                         booker BIGINT references USERS(id),
                         status VARCHAR(555),
                        CONSTRAINT pk_booking PRIMARY KEY (id)
);



CREATE TABLE comments (
                          id BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
                          comment_text varchar(555) not null,
                          item bigint references ITEMS(id),
                          author BIGINT references USERS(id) ,
                          created TIMESTAMP WITHOUT TIME ZONE
);

