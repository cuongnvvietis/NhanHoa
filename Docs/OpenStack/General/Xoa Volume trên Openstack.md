    DELETE FROM volume_admin_metadata WHERE volume_id='e51a3649-f1fc-4958-bde3-4f9bdf3e4513';
    DELETE FROM volume_metadata WHERE volume_id='e51a3649-f1fc-4958-bde3-4f9bdf3e4513';
    DELETE FROM volume_glance_metadata WHERE volume_id='e51a3649-f1fc-4958-bde3-4f9bdf3e4513';
    DELETE FROM snapshots WHERE volume_id='e51a3649-f1fc-4958-bde3-4f9bdf3e4513';
    DELETE FROM backups WHERE volume_id='e51a3649-f1fc-4958-bde3-4f9bdf3e4513';
    DELETE FROM volume_attachment WHERE volume_id='e51a3649-f1fc-4958-bde3-4f9bdf3e4513';
    DELETE FROM volumes WHERE id='e51a3649-f1fc-4958-bde3-4f9bdf3e4513';
