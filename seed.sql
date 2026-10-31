-- Fictional animals available for adoption.
-- Column names are listed explicitly; id is omitted so SQLite assigns it.
-- INSERT OR IGNORE skips a row if that name already exists, so init_db.py can be re-run safely.

INSERT OR IGNORE INTO dogs (name, age, breed, description) VALUES
  ('Biscuit', 2, 'Beagle mix',
   'A cheerful nose-first explorer who loves long sniffy walks and is learning to wait politely for treats.'),
  ('Juniper', 0, 'Labrador retriever mix',
   'A fluffy puppy with endless energy. She is crate-training well and will do best with a family that enjoys play and patience.'),
  ('Moose', 6, 'Great Pyrenees',
   'A gentle giant who prefers lounging near his people. Calm with children and other dogs, and happiest with a fenced yard.'),
  ('Pepper', 4, 'Border collie mix',
   'A bright, athletic dog who already knows sit, down, and shake. She would thrive with an active home and puzzle toys.'),
  ('Waffles', 9, 'Corgi mix',
   'A sweet senior with a wiggly walk and a big appetite for belly rubs. Looking for a quiet home and a cozy couch.');

INSERT OR IGNORE INTO cats (name, age, breed, description) VALUES
  ('Clementine', 1, 'Domestic shorthair (orange tabby)',
   'A playful, chatty young cat who chases feather wands and greets everyone at the door.'),
  ('Marbles', 0, 'Domestic shorthair (tuxedo)',
   'A curious kitten who loves climbing cat trees. Raised with gentle dogs and comfortable being held.'),
  ('Nimbus', 7, 'Russian blue mix',
   'A quiet, affectionate lap cat who is shy at first and blossoms once he knows you. Best in a calm home.'),
  ('Olive', 3, 'Domestic longhair (tortoiseshell)',
   'A confident, independent cat with plenty of opinions. She enjoys window perches and a predictable routine.'),
  ('Sprocket', 5, 'Siamese mix',
   'A talkative companion who follows you from room to room and loves interactive toys and a warm blanket.');
