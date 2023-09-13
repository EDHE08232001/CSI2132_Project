--Create Function
/*
CREATE FUNCTION myFunction()
    RETURNS TRIGGER
    LANGUAGE PLPSQL
AS $$
BEGIN
    Trigger Logic
END;
$$
*/

-- Crate Trigger
/*
CREATE TRIGGER myTrigger
    {BEFORE | AFTER | INSTEAD OF} {event_name}
    ON table_name
    [FOR [EACH] { ROW | STATEMENT }]
        EXECUTE PROCEDURE myFunction();
*/

-- Drop PostgreSQL Triggers
/*
DROP TRIGGER [ IF EXISTS ] name ON table_name [ CASCADE | RESTRICT ]
*/

-- Alter Triggers
/*
ALTER TRIGGER name ON table_name RENAME TO new_name

ALTER TRIGGER name ON table_name [ NO ] DEPENDS ON EXTENSION extension_name
*/

-- Disable Triggers
/*
ALTER TABLE table_name DISABLE TRIGGER trigger_name | ALL
*/

-- Enable Triggers
/*
ALTER TABLE table_name ENABLE TRIGGER trigger_name | ALL
*/