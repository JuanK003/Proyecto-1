from tkinter import * 
from tkinter import filedialog

window=Tk()
window.geometry('700x600')
window.config(bg='#2E424D')
window.title('Proyecto#1 Compiladores')

def openFile():
    file = filedialog.askopenfile(title='Abrir',filetypes=(('Archivos de Julia', '*.jl'),('Archivos de Lex','*.l')))
    listbox.insert(END, file.name)

#
listbox=Listbox(window)
listbox.place(relx=0.15,rely=0.1,relwidth=0.3,relheight=0.7)

listbox2=Listbox(window)
listbox2.place(relx=0.5,rely=0.1,relwidth=0.3,relheight=0.7)
button=Button(window,width=15,text='Abrir Archivo', command=openFile).pack()

window.mainloop()