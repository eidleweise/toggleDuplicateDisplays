# https://ss64.com/nt/displayswitch.html
#
# displayswitch /internal Use one monitor, the internal one, only.
# displayswitch /clone Show the same content on both (all?) monitors.
# displayswitch /extend Make content larger, allow mouse to move from one monitor to the other.
# displayswitch /external Use one monitor, the external one, only.


# Check if the file exists
if (Test-Path "toggleDisplayStatus.txt") {
    $fileContent = Get-Content "toggleDisplayStatus.txt" | Select-Object -First 1

    switch ($fileContent.Trim().ToLower()) {
        "internal" {
            displayswitch /extend
            Set-Content "toggleDisplayStatus.txt" "extend"
        }
        default {
            displayswitch /internal
            Set-Content "toggleDisplayStatus.txt" "internal"
        }
    }
} else {
    # File does not exist, default to internal
    displayswitch /internal
    Set-Content "toggleDisplayStatus.txt" "internal"
}
