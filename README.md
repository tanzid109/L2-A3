A Foreign Key is a column that links one table to the Primary Key of another, enforcing what's called referential integrity.
This safeguards data in two ways:

On INSERT — if you try to book a ticket for match_id = 999 which doesn't exist in the matches table, the database throws a constraint violation error and rejects the row entirely.This prevents fake or broken data from entering your system
On DELETE — you can't delete a match from matches if bookings still reference it, unless you explicitly configure ON DELETE CASCADE (auto-delete children) or ON DELETE SET NULL

A Foreign Key is like a security guard. In the bookings table, match_id is a foreign key that checks the matches table before allowing any booking to be saved.
So if someone tries to book a ticket for match ID 999, but match 999 doesn't exist in the matches table — the database will refuse to save it and show an error. .
Simple version: "You can't book a ticket for a match that doesn't exist."