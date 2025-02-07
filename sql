CREATE DATABASE MakeupAI;
USE MakeupAI;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Preferences Table
CREATE TABLE Preferences (
    preference_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    preference_type ENUM('natural', 'glam', 'edgy') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Recommendations Table
CREATE TABLE Recommendations (
    recommendation_id INT AUTO_INCREMENT PRIMARY KEY,
    preference_type ENUM('natural', 'glam', 'edgy') NOT NULL,
    recommendation_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Sample Recommendations
INSERT INTO Recommendations (preference_type, recommendation_text) VALUES
('natural', 'Try a light BB cream, nude lipstick, and soft brown eyeshadow.'),
('glam', 'Go for a full coverage foundation, bold red lips, and dramatic eyeliner.'),
('edgy', 'Experiment with dark smoky eyes, deep matte lipstick, and sharp contouring.');
