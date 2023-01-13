# OFDM_sendPDF
sending PDF using OFDM modulation 

## Step by step
1. build your own `encode` and `decode` binary form source : https://github.com/aicodix/modem
2. put your binary to this folder/directory
3. open 2 terminal.
   - first terminal run `bash sendFILE.sh`
   - second terminal run `bash LISTENER.sh`
   
## note
1. if you want to run the script with transciever, run the `rigctld` first, so the script will activated ptt via `rigctl -m 2 T 1`
2. if you want to run without transciever, just uncomment the line that contain `rigctl -m 2 T 1` and `rigctl -m 2 T 0` at the `sendFILE.sh` script
