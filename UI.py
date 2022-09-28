from tkinter import * 
from tkinter import filedialog
import subprocess
import os


window=Tk()
window.geometry('700x600')
window.config(bg='#2E424D')
window.title('Proyecto#1 Compiladores')

def openFile():
    global subprocess

    file = filedialog.askopenfile(title='Abrir',filetypes=(('Archivos de Julia', '*.jl'),('Archivos de Lex','*.l')))

    os.system('flex archivo.l')
    os.system('gcc lex.yy.c -L"C:\\MinGW\\msys\\1.0\\lib" -lfl -o archivo.exe')

    ruta_archivo = file.name + ""

    with open(ruta_archivo, 'r') as file:
        lns = file.readlines()

    for p in lns:
        listbox.insert(END, p)

    subprocess = subprocess.Popen("archivo.exe <" + ruta_archivo, shell=True, stdout=subprocess.PIPE)
    subprocess_return = subprocess.stdout.read().decode('utf-8')
    print(subprocess_return)

    for p in subprocess_return.split('\n'):
        listbox2.insert(END, p)

#
listbox=Listbox(window)
listbox.place(relx=0.15,rely=0.1,relwidth=0.3,relheight=0.7)

listbox2=Listbox(window)
listbox2.place(relx=0.5,rely=0.1,relwidth=0.3,relheight=0.7)
button=Button(window,width=15,text='Abrir Archivo', command=openFile).pack()

window.mainloop()