## Este script carga y explora el archivo maizteocintle_SNP50k_meta_extended.txt
## y guarda en un archivo submat.cvs las muestras de las razas Reventador, Jala y Ancho.
 # Brenda González

# cargar el archivo
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt", header = T, fill =T)
View(fullmat)
# tipo de objeto que tenemos al cargar la base
class(fullmat)
# Muestra las primeras 6 líneas del archivo
head(fullmat)
# Muestra el tamaño del data frame, 165 filas, 22 columnas. Hay 165 muestras
dim(fullmat)
# Muestras por estado
summary(fullmat$Estado)
# Muestras colectadas antes de 1980
fullmat[fullmat$A.o._de_colecta < 1980,]->x
View(x)
dim(x) #tiene NA
#Muestras de cada raza
summary(fullmat$Raza)
# Promedio de altitud a la que se colectaron las muestras
mean(fullmat$Altitud)
# Altitud mínima y máxima a la que se colectaron
range(fullmat$Altitud)
# Sólo datos de la raza Olotillo
Olotillo <- fullmat[fullmat$Raza == "Olotillo",]
# Sólo datos de tres razas, se guardan en un archivo .csv
razas3 <- fullmat[fullmat$Raza == c("Reventador", "Jala", "Ancho"),]
write.csv(razas3, "../meta/submat.cvs")

