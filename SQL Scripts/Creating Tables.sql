
CREATE TABLE Alias (
    Alias_ID INT PRIMARY KEY,          -- Alias ID (primary key)
    Alias_Name VARCHAR(255),           -- Alias Name
    Phone_Number VARCHAR(50),          -- Phone Number
    Email VARCHAR(255),                -- Email
    Email_Passwords VARCHAR(255),      -- Email Passwords
    Area_Code VARCHAR(30)              -- Area Code
);

CREATE TABLE Property (
    Property_ID INT PRIMARY KEY,      -- Property ID from 'PID'
    Property_Name VARCHAR(255),       -- Property name from 'PROPERTY'
    Mgmt_Company VARCHAR(255),        -- Management company from 'MGMT CO.'
    Phone_Number VARCHAR(50),         -- Phone number from 'PHONE'
    Address VARCHAR(255),             -- Address from 'ADDRESS'
    Website VARCHAR(255),             -- Website from 'WEBSITE'
    Apartments_URL VARCHAR(255)       -- Apartments.com URL from 'APARTMENTS.COM'
);


CREATE TABLE combined_Follow_up_Data (
    Property_ID INT ,
    Alias_ID INT ,
    Date DATETIME ,
    Content TEXT ,
    Attachments TEXT,
    Communication_Type VARCHAR(50),
    ID int Primary key, 
    FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
    FOREIGN KEY (Alias_ID) REFERENCES Alias(Alias_ID)
);


CREATE TABLE raw_email_logs (
    Email_ID VARCHAR(100) ,
    Subject VARCHAR(255),
    Date_Time DATETIME,
    Body TEXT,
    Attachments text,
    Alias_ID int,
    ID int primary key,
    FOREIGN KEY (Alias_ID) REFERENCES Alias(Alias_ID)  -- Foreign key referencing Alias table
);

CREATE TABLE raw_text_logs (
    date datetime,                  -- Keeping as VARCHAR since you requested not to use datetime dtype
    message_id VARCHAR(255) primary key,
    name VARCHAR(255),
    email VARCHAR(255),
    target_type VARCHAR(255),
    target_id VARCHAR(255),
    sender_id VARCHAR(255),
    direction VARCHAR(255),
    to_phone VARCHAR(255),
    from_phone VARCHAR(255),
    encrypted_text TEXT,
    encrypted_aes_text TEXT,
    mms VARCHAR(255),
    timezone VARCHAR(255)
);


CREATE TABLE raw_voicemail_logs (
    call_id bigint primary key,
    target_id bigint,
    name TEXT,
    email TEXT,
    external_number VARCHAR(50),
    internal_number VARCHAR(50),
    date DATETIME,
    date_listened DATETIME,
    listened_by_target_id bigint,
    listened_by_name TEXT,
    listened_by_email TEXT,
    recording_url TEXT,
    transcription_text TEXT,
    timezone TEXT
);


CREATE TABLE updated_voicemail_logs (
    date DATETIME,
    call_id VARCHAR(255) primary key,
    target_id VARCHAR(255),
    recording_url TEXT,
    transcription_text TEXT,
    ReceiverPhoneNumber VARCHAR(20),
    SenderPhoneNumber VARCHAR(20),
    Property_ID INT,
    Top_Property_Matches TEXT,
    Match_Scores TEXT,
    Matched_Words TEXT,
    Alias_ID int,
    FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
    FOREIGN KEY (Alias_ID) REFERENCES Alias(Alias_ID) 
);

CREATE TABLE updated_text_logs (
    date DATETIME,
    message_id VARCHAR(255) primary key,
    target_id VARCHAR(255),
    encrypted_aes_text TEXT,
    ReceiverPhoneNumber VARCHAR(20),
    SenderPhoneNumber VARCHAR(20),
    Property_ID INT,
    Alias_ID INT,
    FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
    FOREIGN KEY (Alias_ID) REFERENCES Alias(Alias_ID) 
);

CREATE TABLE updated_email_logs (
    Email_ID VARCHAR(255),
    Subject TEXT,
    Date_Time DATETIME,
    Body TEXT,
    Attachments TEXT,
    Alias_ID INT,
    Property_ID INT,
    ID int primary key, 
    FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
    FOREIGN KEY (Alias_ID) REFERENCES Alias(Alias_ID) 
);

CREATE TABLE classified_follow_up_data (
    Property_ID INT,
    Alias_ID INT,
    Date DATETIME,
    Summary_of_content TEXT,
    Attachments TEXT,
    Type_of_communication VARCHAR(255),
    Tour_Confirmation BOOLEAN,
    Booking_Link BOOLEAN,
    Requests_Tour_Booking BOOLEAN,
    Contains_Pictures BOOLEAN,
    Personalized_or_Generalized VARCHAR(50),
    ID int primary key,
    FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
    FOREIGN KEY (Alias_ID) REFERENCES Alias(Alias_ID) 
);

CREATE TABLE Follow_up_Count (
    Property_ID INT NOT NULL,
    Alias_ID INT NOT NULL,
    Total_Follow_Ups varchar(100),
    PRIMARY KEY (Property_ID, Alias_ID),
    FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID),
    FOREIGN KEY (Alias_ID) REFERENCES Alias(Alias_ID) 
);






