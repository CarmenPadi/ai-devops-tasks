# Simple database backup script

$DB_NAME = "app_database"
$BACKUP_DIR = "C:\backups\db"
$DATE = Get-Date -Format "yyyyMMdd_HHmmss"
$FILENAME = "$BACKUP_DIR\$DB_NAME" + "_$DATE.sql.gz"

# Check if the directory exists
if (-not (Test-Path $BACKUP_DIR)) {
    New-Item -ItemType Directory -Path $BACKUP_DIR | Out-Null
    Write-Host "Created directory $BACKUP_DIR"
}

# Perform the backup
Write-Host "Starting backup of $DB_NAME..."

# Prompt for MySQL root password
$mysqlPwd = Read-Host -AsSecureString "Enter MySQL root password"
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($mysqlPwd)
$plainPwd = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

# Run mysqldump and gzip
$mysqldump = "mysqldump -u root -p$plainPwd $DB_NAME"
$gzip = "gzip"
$command = "$mysqldump | $gzip > `"$FILENAME`""

# Execute the command in cmd.exe
cmd.exe /c $command

if ($LASTEXITCODE -eq 0) {
    Write-Host "Backup successful: $FILENAME"
} else {
    Write-Host "Backup failed!"
    exit 1
}
