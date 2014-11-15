DROP TABLE IF EXISTS address_entries;
DROP TABLE IF EXISTS phone_numbers;
DROP TABLE IF EXISTS emails;




CREATE TABLE address_entries(
	id INTEGER PRIMARY KEY,
	first_name VARCHAR(300),
	last_name VARCHAR(300)
);

CREATE TABLE phone_numbers(
	id INTEGER PRIMARY KEY,
	category VARCHAR(300),
	digits VARCHAR(300),
	address_entry_id INTEGER
);
CREATE TABLE emails(
	id INTEGER PRIMARY KEY,
	category VARCHAR(300),
	address VARCHAR(300),
	address_entry_id INTEGER
);