
# Welcome to CsegNotes

<p>This is a group collab Obsidian vault which contains all the notes from the classes of faculty of computer science, english branch. <br>
We aim to create a detailed explanation of classes such that learning is easier than ever  
It is open source, which means that everyone can contribute to it so feel free make improvements </p>



# Guidelines
## Must follow, non-negotiables
For convenience and ease of use each file in `\src` must follow the following naming structure:
```
"Name_of_period course/seminar number_of_said_course"
```

**Important!** 
Right below the title there should be a tag with the following structure
```
#day_month_year
```
>This is done so that it's easier to find courses that were in the same date. You just search for `#example_date` and you will get all the courses in that day

## Other
It is important for files across the vault to be somewhat similar to each other for better readability. It is also easier to follow a structure than having to create your own when writing new notes

That being said each note should follow the following structure:
> ## Object
> some description of what is it if needed
> ### Definition
> ### Properties
> ### Methods and observations
> anything else

here is an example:
<details><summary> Example </summary>
    <p>
        
    
># Functii
>## Definiție
>O funcție este un set de operații redenumite sub un alias
>
>#### Sintaxă 
>f(x): D -> C = x ⋅ 2 + 4
>
>#### Proprietăți
>###### ==Generale==
>D - Domeniul de definiție: 
>
>^domeniu
>
>Domeniul de apartenență al elementelor pe care se aplică funcția 
>
><br>
>C - Codomeniul <small>sau Imaginea funcției</small>
>
>^codomeniu
>
>Domeniul de apartenență al elementelor rezultate pe urma aplicării funcției 
>
></br>
>Continuitate
>
>>Dacă funcția are salturi în imaginea ei sau nu
>><=>
>>Dacă exista puncte de discontinuitate 
>
><br>
>
>###### ==Opționale==
>
>Injectivitate <small>inj</small>
>^inj
>>O funcție nu este injectivă dacă două elemente ale funcției au același rezultat (f($x_1$)=f($x_2$), $x1 \neq x2$)
>
>
>Surjectivitate <small>surj</small>
>^surj
>>O funcție este surjectivă dacă [[#^domeniu|domeniul de definiție]] = [[#^codomeniu|codomeniul său]]
>
>Bijectivitate <small>bij</small>
> ^bij
>>O funcție este bijectivă dacă este și surjectivă și >injectivă 
>
><Br><br>
>#### Rezolvări 
>##### Injectivitate
>1. Demonstrezi că $\forall x_1, x_2 \in D, x_1 \neq x_2: f(x_1) \neq f(x_2)$
>sau
>2. $f(x_1) = f(x_2) \Rightarrow x_1 = x_2$
>
>##### Surjectivitate
>1. Se calculează [[#^codomeniu|codomeniul]] funcției
>2. Se compară codomeniul cu domeniul de definiție
</p>
</details>

You can find some templates to assist you in `/Templates`


# Deployment

To use this vault on your computer you must have [Obsidian](https://obsidian.md/download) and [Git](https://git-scm.com/downloads) installed on your computer


### First time deployment
If this is your first time using this vault you should follow these two steps:

#### 1. Clone this repository
In your preferred terminal, navigate to the folder where you want to deploy the vault then type the following command 
```bash    
  git clone https://github.com/Cucuteanu-Tudor-912/Notite_UBB_912.git
```

#### 2. Open Obsidian vault
Open **Obsidian** and then press **open folder as vault**
![Open folder as vault](/ReadmeSrc/OpenVault.PNG)

In the popup, navigate to the folder where you cloned the repository and after that press **select folder**

### Opening the vault
In case that Obsidian doesn't open in your vault you can switch vaults by clicking the button located in the bottom left side of the window 
![SwitchVault](/ReadmeSrc/SwitchVault.PNG)


