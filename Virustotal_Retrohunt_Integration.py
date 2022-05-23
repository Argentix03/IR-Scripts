import sys, getopt
import time
import virustotal_python
from pprint import pprint
import time
import requests
import os
import vt
import cowsay
from colorama import Fore, Style


def main(argv):
    count = 0
    limet = 0
    path = 'null'
    buffer = 'find_me_some_passwords:'
    number_of_hash = 0
    goodapi_arry = []
    try:
        opts, args = getopt.getopt(argv, "hl:p:b:", ["lfile=", "pfile=", "bfile="])
    except getopt.GetoptError:
        print(Fore.LIGHTBLUE_EX + 'try -h' + Style.RESET_ALL)
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print(Fore.LIGHTBLUE_EX + cowsay.get_output_string('dragon', 'The Room') + Style.BRIGHT + Style.RESET_ALL)
            print(Fore.LIGHTBLUE_EX + 'TheRoom.py -l <limet> -p <hash file> -b <buffer>' + Style.RESET_ALL)
            sys.exit()
        elif opt in ("-l", "--lfile"):
            limet = arg
        elif opt in ("-p", "--pfile"):
            path = arg
        elif opt in ("-b", "--bfile"):
            buffer = arg
    if path == "null" or '.txt' not in path:
        print(Fore.LIGHTRED_EX + "Please check if your file exists" + Style.RESET_ALL)
        sys.exit()
    else:
        try:
            with open(f"{path}", "r") as file_with_the_hash:
                print(Fore.LIGHTBLUE_EX + cowsay.get_output_string('dragon', 'The Room') + Style.BRIGHT + Style.RESET_ALL)
                print(Fore.CYAN + f'Hash file : {path}' + Style.RESET_ALL)
                print(Fore.CYAN + f"Your Limit is : {int(limet)}" + Style.RESET_ALL)
                print(Fore.CYAN + f"Your Buffer: \"{buffer}\"" + Style.RESET_ALL)
                for i in file_with_the_hash.readlines():
                    number_of_hash += 1
                print(Fore.CYAN + f"Total of hash: {number_of_hash}" + Style.RESET_ALL)
        except FileNotFoundError:
            print(Fore.LIGHTRED_EX + "No such file or directory, are you sure this is a hash file?" + Style.RESET_ALL)
            sys.exit()
    start_time = time.time()
    with open("api.txt", "r") as apifile:
        for e in apifile.readlines():
            q = e.replace("\n", "")
            try:
                with virustotal_python.Virustotal(q) as vt:
                    respons = vt.request(f"files/5b1ded2318b60548a9bdfe15852bc2bc5f20de932fd3aa4211397f4c09aa234e")
                    with open("good_api.txt", "a") as goodapi:
                        goodapi_vule = q + "\n"
                        goodapi.write(goodapi_vule)
            except virustotal_python.virustotal.VirustotalError:
                pass
    with open("good_api.txt", "r") as goodapi_testing:
        for o in goodapi_testing:
            p = o.replace("\n", "")
            goodapi_arry.append(p)
    print(Fore.CYAN + f'Api Loded : {len(goodapi_arry)}' + Style.RESET_ALL)
    while int(limet) > count:
        for api in goodapi_arry:
            #reding the hash file
            if int(limet) > count:
                with open(f"{path}", "r") as file_with_the_hash:
                        for i in file_with_the_hash.readlines():
                            if int(limet) > count:
                                r = i.replace(f"{buffer}", "")
                                file_hash = r.replace("\n", "")
                                FILE_ID = file_hash
                                #sending the requist
                                with virustotal_python.Virustotal(api) as vt:
                                        try:
                                            print(Fore.GREEN + f"Amount of requests left: {int(limet) - count}" + Style.RESET_ALL)
                                            #send the request to virustotal
                                            respons = vt.request(f"files/{FILE_ID}")
                                            #print the result
                                            print("Score:", respons.data["attributes"]["last_analysis_stats"]["malicious"], ":",
                                                  Fore.MAGENTA + respons.data["attributes"]["meaningful_name"] + Style.RESET_ALL, ":HASH:",
                                                  Fore.YELLOW + file_hash + Style.RESET_ALL)
                                            malicious_file = respons.data["attributes"]["last_analysis_stats"]["malicious"]
                                            count += 1
                                        except:
                                            count += 1
                                        try:
                                            if malicious_file >= 6:
                                                print("Malicious file Found", respons.data["attributes"]["last_analysis_stats"]["malicious"])
                                                with open("malicious_File_To_Download.txt", "a") as file3:
                                                    file3.write(respons.data["attributes"]["meaningful_name"]
                                                                + ":HASH:" + file_hash + "\n")
                                                continue
                                            else:
                                                with open("Files_To_Download.txt", "a") as file2:
                                                    file2.write(
                                                        respons.data["attributes"]["meaningful_name"] + " :HASH:" + file_hash + "\n")
                                            sleep = 4 * len(goodapi_arry)
                                            time.sleep(60/sleep)
                                        except KeyError:
                                            print("KeyError: 'meaningful_name'")
                        else:
                            break
            else:
                break

    print(Fore.CYAN + "[+] you recede your limit [+]" + Style.RESET_ALL)
    print(Fore.GREEN + "--- %s seconds ---" % (round(time.time() - start_time)) + Style.RESET_ALL)
    userblack = input("file extinctions BlackList:").lower()
    n_userblack = userblack.split(",")

    print(Fore.RED + f"Files BlackList\n{n_userblack}" + Style.RESET_ALL)
    userInput = input("Do You Want to Download[y/n/m]:")
    if userInput == "y":
        directory = "Target"
        directory2 = "Malicious"
        parent_dir = "."
        parent_dir2 = "./Target"
        path = os.path.join(parent_dir, directory)
        path2 = os.path.join(parent_dir2, directory2)
        try:
            os.mkdir(path)
            os.mkdir(path2)
        except OSError:
            pass
        with open("Files_To_Download.txt", "r") as file3:
            for line in file3.readlines():
                filename = line.split(":")[0]
                extension = filename.split(".")[-1]
                extension1 = extension.replace("\n", "")
                extension2 = extension1.replace(" ", "").lower()
                if extension2 in n_userblack:
                    continue
                else:
                    file_to_download = line.split(":")[2]
                    filename = line.split(":")[0]
                    the_file = file_to_download.replace("\n", "")
                    api_key = i
                    url = f"https://www.virustotal.com/api/v3/files/{the_file}/download"
                    try:
                        os.system(f"curl --request GET -L --url {url} -H \"x-apikey: {api_key}\" -o Target/{filename}")
                        print(Fore.GREEN + f"The file {filename} was downloaded successfully" + Style.RESET_ALL)
                    except:
                        print(f"Curl Problem {filename}")
    elif userInput == "m":
        with open("malicious_File_To_Download.txt", "r") as file4:
            directory = "Target"
            directory2 = "Malicious"
            parent_dir = "."
            parent_dir2 = "./Target"
            path = os.path.join(parent_dir, directory)
            path2 = os.path.join(parent_dir2, directory2)
            try:
                os.mkdir(path)
                os.mkdir(path2)
            except OSError:
                pass
            for line in file4.readlines():
                filename = line.split(":")[0]
                extension = filename.split(".")[-1]
                extension1 = extension.replace("\n", "")
                file_to_download = line.split(":")[2]
                filename = line.split(":")[0]
                the_file = file_to_download.replace("\n", "")
                api_key = api
                url = f"https://www.virustotal.com/api/v3/files/{the_file}/download"
                try:
                    os.system(f"curl --request GET -L --url {url} -H \"x-apikey: {api_key}\" -o Target/Malicious/{filename}")
                    print(Fore.GREEN + f"The file {filename} was downloaded successfully" + Style.RESET_ALL)
                except:
                    print(f"Curl Problem {filename}")

    else:
        print(Fore.GREEN + "Done!" + Style.RESET_ALL)
    os.system("rm -r 'good_api.txt'")
    os.system("rm -r 'Files_To_Download.txt'")
if __name__ == "__main__":
    main(sys.argv[1:])
