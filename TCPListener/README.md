# TCPListenerProcessMap

## Overview

TCPListenerProcessMap is a PowerShell script that retrieves all TCP connections in the "Listen" state and maps each listening port to its corresponding process name. It outputs a formatted table displaying the local address, local port, owning process ID, and process name.

## Prerequisites

- Windows PowerShell 5.1+ or PowerShell Core
- Administrative privileges may be required

## Usage

1. **Download the script:**  
   Clone the repository or download `TCPListenerProcessMap.ps1`.

2. **Open PowerShell:**  
   Run PowerShell as Administrator.

3. **Execute the script:**  
   Navigate to the script's directory and run:

   ```powershell
   .\TCPListenerProcessMap.ps1
   ```
   
4. **View results:**
   The script outputs a table with the TCP listening details.

## Author

John Requejo

## Creation Date 

2025/03/14

## License

This project is open source under the [MIT License](https://opensource.org/licenses/MIT).


## Contributing

Contributions are welcome! Feel free to fork this repository and submit pull requests.