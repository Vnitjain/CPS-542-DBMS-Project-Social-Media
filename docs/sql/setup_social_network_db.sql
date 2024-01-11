create table User(user_id bigint unsigned not null primary key auto_increment, user_name varchar(50),email varchar(50),password varchar(50), account_bio varchar(255), creation_time timestamp);

create table Posts(post_id int unsigned not null primary key auto_increment, creation_time timestamp, caption varchar(255), location varchar(255),user_id bigint unsigned,foreign key(user_id) references User(user_id) on delete cascade on update cascade);

create table Photos(photo_id int unsigned not null primary key auto_increment, photo_url varchar(255) unique,creation_time timestamp,caption varchar(255),post_id int unsigned,foreign key(post_id) references Posts(post_id) on delete cascade on update cascade);

create table User_groups(group_id int unsigned not null primary key auto_increment, group_name varchar(50), group_description varchar(255));

create table Belongs_to(group_id int unsigned, group_member_id bigint unsigned, foreign key(group_id) references User_groups(group_id),foreign key(group_member_id) references User(user_id));

create table Logbook(user_id int, login_time timestamp not null unique, ip_address varchar(20), device_type varchar(20));

create table Messages(user_to bigint unsigned, user_from bigint unsigned, foreign key(user_to) references User(user_id),foreign key(user_from) references User(user_id));

create table Follows(follower bigint unsigned, following bigint unsigned, foreign key(follower) references User(user_id), foreign key(following) references User(user_id));

create table Reactions(user_id bigint unsigned, post_id int unsigned, reaction_time timestamp, reaction_type varchar(20), foreign key(user_id) references User(user_id),foreign key(post_id) references Posts(post_id));

create table Comments(user_id bigint unsigned, post_id int unsigned, creation_time timestamp, comment_text varchar(255), foreign key(user_id) references User(user_id),foreign key(post_id) references Posts(post_id));
