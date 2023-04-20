-- Assuming the nginx access logs are stored in a file named 'access.log'
-- and have the following format: '$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent'

-- Create a table to store nginx logs
CREATE TABLE nginx_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    remote_address VARCHAR(255),
    remote_user VARCHAR(255),
    timestamp DATETIME,
    http_method VARCHAR(10),
    uri VARCHAR(255),
    http_version VARCHAR(10),
    status_code INT,
    response_size INT
);

-- Load data from the nginx access log file into the table
LOAD DATA INFILE '/var/log/nginx/access.log'
INTO TABLE nginx_logs
FIELDS TERMINATED BY ' '
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(@remote_address, @remote_user, @timestamp, @http_method, @uri, @http_version, @status_code, @response_size)
SET
    remote_address = SUBSTRING_INDEX(@remote_address, '-', 1),
    remote_user = SUBSTRING_INDEX(SUBSTRING_INDEX(@remote_address, '-', -1), ' ', -1),
    timestamp = STR_TO_DATE(SUBSTRING_INDEX(@timestamp, '[', -1), '%d/%b/%Y:%H:%i:%s'),
    http_method = SUBSTRING_INDEX(SUBSTRING_INDEX(@request, ' ', 1), ' ', -1),
    uri = SUBSTRING_INDEX(SUBSTRING_INDEX(@request, ' ', 2), ' ', -1),
    http_version = SUBSTRING_INDEX(SUBSTRING_INDEX(@request, ' ', -2), ' ', -1),
    status_code = @status_code,
    response_size = @body_bytes_sent;
