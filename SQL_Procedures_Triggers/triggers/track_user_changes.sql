CREATE OR REPLACE TRIGGER TrackUserChanges
AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
    INSERT INTO UserChangeLog (UserID, OldUsername, NewUsername, ChangeDate)
    VALUES (:OLD.UserID, :OLD.Username, :NEW.Username, CURRENT_TIMESTAMP);
END;

