--
-- Drop Tables
--

SET foreign_key_checks = 0;
DROP TABLE if exists users;
DROP TABLE if exists weeks;
DROP TABLE if exists symptoms;
DROP TABLE if exists weeks_symptoms;
SET foreign_key_checks = 1;

--
-- Create Tables
--
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,    
    mail VARCHAR(255) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    baby_name VARCHAR(255),
    creation_date DATE NOT NULL,
    weeks_pregnant INT,
    photo_url VARCHAR(255) 
);

CREATE TABLE weeks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    week_number INT NOT NULL,    
    baby_image VARCHAR(255) NOT NULL,
    baby_size VARCHAR(255) NOT NULL,
    baby_development VARCHAR(1300)
);

CREATE TABLE symptoms(
    id INT AUTO_INCREMENT PRIMARY KEY,
    symptom_name VARCHAR(255) NOT NULL,
    symptom_description VARCHAR(600) NOT NULL
);

CREATE TABLE weeks_symptoms (
    week_id INT NOT NULL,
    symptom_id INT NOT NULL,
    FOREIGN KEY (week_id) REFERENCES weeks(id),
    FOREIGN KEY (symptom_id) REFERENCES symptoms(id)
);

INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 3, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'semilla de calabaza', 'El cigoto comenzará a subir por la trompa de Falopio en dirección al útero tras dividirse en varios grupos de células.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 4, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'semilla de calabaza', 'El óvulo fecundado se implantará en un lateral del útero y se dividirá rápidamente en capas de células. Algunas de ellas se convertirán en el embrión. Las capas de células pasarán a ser las partes del cuerpo de tu pequeño,');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 5, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'semilla de naranja', 'Se están formando la placenta y el cordón umbilical, que enviarán oxígeno y nutrientes al embrión. Además, esta semana seguirá desarrollándose el tubo neural, que terminará siendo la columna vertebral y el cerebro del bebé.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 6, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'semilla de granada', 'El hito más importante de esta semana es que el tubo neural comenzará a adoptar la forma de la columna vertebral del bebé. Además, las zonas que se convertirán en los ojos y los oídos adoptarán el aspecto de protuberancias y aparecerán unos pequeños brotes que se convertirán en los brazos y las piernas. La nariz, la boca, los oídos y las orejas también comenzarán a formarse junto con los pulmones.

En la ecografía de esta semana podrá detectarse un pequeño corazón con aproximadamente 105 latidos por minuto.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 7, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'arándano', 'Aunque el cerebro del bebé seguirá evolucionando mucho tiempo después del nacimiento, ahora se formarán las secciones básicas. A medida que avance la semana, el sistema digestivo y los pulmones también se desarrollan. Además, comenzarán a aparecer los rasgos faciales y unas pequeñas manitas en cada brazo. 

Otro hito importante de esta semana es la creación del cordón umbilical.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 8, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'frambuesa', 'Esta semana aparecerán pequeños dedos en las manos y los pies de tu pequeño. Además, podrá flexionar los brazos a la altura de los codos y las muñecas. 

En este punto los ojos desarrollarán pigmento y se comenzarán a formar los genitales, aunque todavía es muy pronto para saber si estás esperando un niño o una niña. 

Estas características externas no son lo único que se desarrollará, ya que también lo harán los órganos internos. Cuando los intestinos estén formados, comenzarán a ocupar espacio en el cordón umbilical, ya que todavía no hay suficiente hueco en el abdomen del bebé.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 9, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'cereza', 'Los rasgos faciales de tu bebé (ahora conocido oficialmente como feto) seguirán desarrollándose estos días. De hecho, la nariz será más prominente. Los dedos de los pies ya pueden verse claramente. 

Los órganos internos también se formarán, incluidos los sistemas digestivo y reproductivo. Esto implica que los intestinos y los testículos o los ovarios crecerán cada vez más. 

Ahora estás embarazada de nueve semanas, es posible que tu pequeño comience a moverse gracias al desarrollo muscular aunque aún no lo puedas notar.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 10, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'fresa', 'A lo largo de estos días la cabeza de tu pequeño adoptará una forma más redonda, mientras que los órganos internos se colocarán en su sitio y comenzarán a funcionar. 

También saldrán unas pequeñas yemas en su boca, que posteriormente serán los dientes. Los dedos se harán más largos y las membranas que hay entre ellos desaparecerán. 

Los ojos, los párpados y los oídos seguirán desarrollándose, pero aún les queda un tiempo para estar completamente formados.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 11, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'col de Bruselas', 'Esta semana estará llena de cambios emocionantes, como el desarrollo de la cabeza o la aparición de yemas en las encías. 

Los rasgos faciales del bebé están madurando poco a poco. Las orejas se moverán hacia su posición final a los lados de la cabeza, mientras que los ojos se separarán y los párpados se mantendrán cerrados. 

Los genitales también se están formando, aunque todavía es pronto para saber si vas a tener un niño o una niña. 

En esta etapa la cabeza representa la mitad de la longitud total del cuerpo, aunque el cuerpo también crecerá significativamente durante las próximas semanas. Para respaldar este crecimiento, tu pequeño necesita más nutrientes, por lo que la placenta crece y la cantidad de glóbulos rojos aumenta.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 12, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'fruta de la pasión', 'La semana 12 de embarazo constituye el final del primer trimestre. Los órganos vitales y el resto de partes del cuerpo de tu pequeño se colocarán en su sitio. 

Seguramente sea posible escuchar el latido del corazón de tu hijo con un dispositivo Doppler.

En este punto los párpados ya se han formado. Permanecerán ligeramente cerrados hasta finales del segundo trimestre.

Las manos se desarrollarán más que los pies, y los brazos serán más largos que las piernas. En las puntas de los dedos saldrán las uñas de manos y pies, que seguirán creciendo durante el próximo trimestre.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 13, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'ciruela grande', 'Esta semana, los órganos de tu pequeño se formarán por completo. Los riñones producirán orina y la liberarán en el líquido amniótico, mientras que el bazo generará glóbulos rojos para transportar oxígeno por el organismo del bebé. 

Los intestinos regresarán al abdomen desde el cordón umbilical, ya que por fin hay espacio suficiente para acomodarlos. Además, algunos de los huesos más grandes, se endurecerán. Y las cuerdas vocales de tu bebé comenzarán a desarrollarse.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 14, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'nectarina', 'Tu pequeño hará algunas cosas nuevas esta semana, como mover los párpados y flexionar los brazos y las piernas. Esto le permitirá practicar la habilidad de llevarse la mano a la boca. 

Los sentidos del gusto y el olfato también se desarrollarán. Además, la piel se endurecerá. Aunque tendrás que esperar a que el bebé nazca para saber si tendrá pelo o no, en este tiempo se formarán los folículos pilosos debajo de la superficie de la piel. ');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 15, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'pomelo', 'Esta semana los rasgos faciales de tu pequeño se colocarán poco a poco en su sitio y las orejas bajarán a ambos lados de la cabeza. Además, también se formará el patrón capilar y comenzará a crecer el pelo. Cada bebé es diferente, por lo que algunos tendrán mucho pelo al nacer y otros, no. Lo que sí es común para todos es la capa de pelo suave y velloso llamado lanugo, que aparecerá esta semana y pronto cubrirá su cuerpecito.

Una piel delgada y traslúcida cubrirá los vasos sanguíneos, que ahora transportarán hasta 47 litros de sangre al día gracias al bombeo de su corazón en desarrollo.

Puede que aún no lo notes, pero tu hijo aumentará mucho su actividad durante estos días. De hecho, comenzará a girar y rodar en el saco amniótico.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 16, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'manzana', 'Los músculos del bebé son cada vez más fuertes. Esta semana erguirá la cabeza y comenzará a realizar movimientos coordinados con brazos y piernas.

Otra novedad de la semana 16 de embarazo es que las orejas del bebé están más cerca de alcanzar su posición final y es posible que pueda escuchar sonidos en este punto o en las próximas semanas.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 17, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'pera', 'Esta semana tu hijo desarrollará una capa de grasa debajo de la piel, que se irá haciendo más gruesa a medida que avance el embarazo. Esta grasa le proporciona energía y le ayuda a mantenerse caliente después de nacer. 

Las glándulas sebáceas de la piel de tu pequeño comenzarán a producir vérnix, una película blanca y grasa que protege la piel y regula la temperatura corporal. 

¿Sabías que también le están saliendo las uñas de los pies? A finales de este mes es probable que ya lleguen hasta las puntas de los dedos. De hecho, a veces hay que cortarlas tras dar a luz.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 18, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'boniato', 'Esta semana tu bebé desarrollará una característica única: las huellas dactilares. Las almohadillas de grasa que hay en las yemas de sus dedos se convertirán en líneas arremolinadas que le distinguirán del resto.

El sistema digestivo, que seguirá formándose, ya lleva funcionando varias semanas. Tu pequeño tragará líquido amniótico, que pasará por el estómago y los intestinos, arrastrando consigo células muertas y secreciones. Todo ello se convertirá en meconio, una sustancia negra y espesa que verás cuando le cambies el pañal por primera vez.

En torno a las 18 semanas las orejas empezarán a sobresalir de los lados de la cabeza. Además, los oídos empezarán a registrar sonidos.

El bebé necesitará bilis para digerir los nutrientes que necesita, por lo que la vesícula biliar comenzará a funcionar.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 19, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'mango', 'Si tu bebé es una niña, su sistema reproductor terminará de desarrollarse. La vagina, el útero y las trompas de Falopio se colocarán en su sitio. Los ovarios contendrán más de seis millones de óvulos, aunque cuando nazca esa cantidad se reducirá a aproximadamente un millón. 

Si es niño, sus testículos ya estarán formados y segregarán testosterona desde la semana 10 de embarazo. No obstante, los genitales seguirán creciendo. 

En esta fase del embarazo la piel de tu pequeño comenzará a producir una capa blanquecina llamada vernix caseosa. Esta sustancia está formada por la grasa que segrega la piel, células muertas y lanugo (es decir, el vello fino que recubre el cuerpo del bebé). Su finalidad es proteger la piel del bebé del líquido amniótico en el que flota. Aunque gran parte de esta sustancia desaparecerá antes de que nazca, es habitual que los bebés prematuros aún la tengan.

En torno a la semana 19 de embarazo el bebé desarrollará unos hábitos de sueño más regulares y se despertará cuando note movimiento o ruido. También le crecerán las uñas en manos y pies. ');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 20, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'pimiento', 'Los rasgos faciales, como la nariz, irán tomando forma. Tu pequeño ya parecerá toda una personita. El reflejo de succión mejorará hasta el punto de que comenzará a chuparse el dedo. Su cerebro seguirá formándose rápidamente, sobre todo los centros nerviosos dedicados a los sentidos. 

Poco a poco desarrollará ciclos definidos de sueño y vigilia. Además, será cada vez más sensible a los sonidos del entorno, por lo que es normal que los ruidos fuertes le despierten.

En esta etapa la piel del bebé se volverá más gruesa. También se formarán las capas de la piel, entre ellas la capa blanquecina que le protege del líquido amniótico, llamada vérnix.

En la semana 20 de embarazo el sistema digestivo de tu hijo comenzará a producir una sustancia pegajosa de color negro verdoso llamada meconio, que se acumulará en sus intestinos durante el resto del embarazo. Por lo general, la expulsará en las primeras horas de vida. ');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 21, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'plátano', 'Esta semana el latido del corazón de tu bebé ya es lo suficientemente fuerte como para escucharlo con un simple estetoscopio, pero puede ser difícil distinguirlo de tu propio latido. Escucha el ritmo más rápido: el latido del bebé es de 120 a 160 latidos por minuto, aproximadamente el doble de rápido que el tuyo.

Tu bebé ya está empezando a dormir y a despertarse en ciclos sutiles. Las ecografías muestran que los bebés que aún no han nacido pueden incluso adoptar una posición favorita para dormir.

En torno a la semana 21 de embarazo, los dedos de las manos y de los pies ya se han formado completamente. 

El sistema digestivo de tu bebé se está desarrollando. El pequeño ya es capaz de tragar pequeñas cantidades de líquido amniótico, que pueden absorber los intestinos. Su pequeño hígado y su bazo han estado produciendo células sanguíneas, pero ahora la médula ósea también puede crearlas. El hígado y el bazo dejarán de producir estas células sanguíneas antes del nacimiento.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 22, 'https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t', 'papaya', 'En la semana 22 de embarazo los párpados de tu bebé aún no están separados, pero los ojos empiezan a moverse. Los conductos lagrimales también se están formando y las cejas de tu bebé son pequeños mechones de pelo blanco y fino. Incluso es posible que frunza esas pequeñas cejas. Además, cada vez es más sensible a los estímulos externos.

El cerebro de tu bebé se está desarrollando rápidamente y se están formando las terminaciones nerviosas. A estas alturas el bebé ya ha desarrollado el sentido del tacto, lo que significa que puede acariciar una parte de su cuerpo a la que llegue por casualidad o chuparse el dedo. Además, está empezando a acumular capas de lo que se denomina grasa parda, que lo ayuda a mantenerse caliente.');



INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('sangrado de implantación', 'Aparición de unas manchitas cuando los blastocistos (es decir, los grupos de células que hemos dicho antes) se fijan en el endometrio. Este sangrado es totalmente normal y se puede confundir con la regla.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('hinchazón en la tripa', 'Tu cuerpo se está preparando para un bebé que crecerá rápidamente durante los próximos meses. No te sorprendas si se te hincha la tripa, sobre todo la zona del abdomen. Esto se debe a que el endometrio es cada vez más grueso, por lo que ocupa más espacio que de costumbre. ');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('manchado o sangrado leve', 'Algunas mujeres observan unas manchitas en la ropa interior durante la cuarta semana de embarazo, lo que se conoce como sangrado de implantación.');


/*INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('cambios de humor', 'Otro síntoma que puedes notar en la cuarta semana de embarazo son los cambios de humor. Estas emociones extremas, que se deben al aumento de los niveles hormonales, pueden ser muy potentes durante el primer y tercer trimestre. Haz ejercicios de relajación, date masajes, descansa y sigue una dieta equilibrada para sentirte mejor.', 2);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('sensibilidad en los pechos', 'Al igual que el abdomen, los pechos se están preparando para alimentar al bebé cuando nazca. Como aumentan la cantidad de glándulas mamarias y el grosor de la capa de grasa, tus pechos se verán más grandes.', 2);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('naúseas', 'Durante la cuarta semana de embarazo puede que tengas náuseas, que provocan una sensación de mareo a cualquier hora del día. Este problema es diferente según la mujer, ya que algunas se marean cuando se levantan y otras incluso llegan a vomitar. Si las padeces, no estás sola, ya que aproximadamente el 85 % de las mujeres experimentan algún tipo de náuseas en el embarazo. Además, la buena noticia es que suelen desaparecer durante el segundo trimestre.', 2);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('flujo de color claro', 'Durante la cuarta semana de embarazo es normal que tengas más flujo vaginal que de costumbre. Debe ser pegajoso y de color claro o blanco. Si huele mal y notas escozor o picor en la zona de la vagina, consulta al médico.', 2);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('fatiga', 'No es de extrañar que te sientas cansada, y esto solo acaba de empezar. Tu cuerpo está trabajando contra reloj para proteger al bebé y los niveles de hormona progesterona están aumentando, lo que supone un desgaste considerable. La fatiga forma parte del embarazo, pero también puede ser un síntoma de falta de hierro. Te recomendamos preguntar al médico sobre la ingesta de hierro, ya que un suplemento puede prevenir la anemia y la sensación de sopor.', 2);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('necesidad frecuente de orinar', 'La necesidad frecuente de orinar puede aparecer en cualquier momento, sobre todo cuando los riñones comienzan a filtrar más líquido debido al aumento del volumen sanguíneo. Aunque este síntoma puede ser molesto, es completamente normal.', 3);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('acné', ' Los cambios hormonales pueden ser los culpables del acné que aparezca como consecuencia del embarazo. Lee sobre acné del embarazo para saber cómo combatir las manchas y las imperfecciones. Recuerda que, sea como sea, lo más probable es que desaparezca cuando nazca el bebé.', 3);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('síntomas leves o inexistentes', '¿Pasa algo si no tienes síntomas a las cinco semanas de embarazo? Es normal que algunas mujeres se sientan completamente normales en esta etapa o experimenten síntomas pasajeros. En cuanto a la tripa, puede que no haya cambiado o que esté un poco hinchada. Si tienes náuseas graves, puede que pierdas un poco de peso durante el primer trimestre. Consulta al médico si tienes dudas sobre los cambios que estás experimentando o si la falta de síntomas te hace sentir incómoda.', 3);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('calambres', 'Durante la sexta semana de embarazo es normal tener calambres leves. Es una señal de que tu útero se está expandiendo para que quepa tu hijo. Si sientes un dolor más intenso que el de los calambres menstruales y tienes fiebre o diarrea, consulta al médico inmediatamente.', 4);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('exceso de salivación', 'Puedes notar más saliva que de costumbre, a menudo acompañada de náuseas o vómitos. Puede parecerte raro, pero solo es otro síntoma del embarazo más para muchas mujeres.', 5);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('antojos o aversión a los alimentos', 'Las preferencias alimentarias y la tolerancia a los olores pueden cambiar durante el embarazo, lo que se debe probablemente a las hormonas. Si sientes ganas de comer cosas que no sean alimentos, como tierra o tiza, consulta inmediatamente al médico.', 5);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('diarrea', 'Ya sabemos que no necesitas más motivos para ir al baño, pero aquí hay otro. Durante la séptima semana es normal tener diarrea. De hecho, es uno de los síntomas gastrointestinales que puedes experimentar debido a los cambios hormonales, como el estreñimiento o la indigestión. Añade alimentos como puré de manzana, avena y plátanos a la dieta para absorber el exceso de agua y mantenerte hidratada, ya que la diarrea puede provocar deshidratación.', 5);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('dolor de espalda', 'Si estás embarazada de ocho semanas, puede dolerte la espalda a la altura de las vértebras lumbares. Esto se debe a que los músculos de la espalda deben trabajar un poco más que de costumbre, ya que tu peso se redistribuye para adaptarse al tamaño del útero. Además, tu centro de gravedad cambiará y las hormonas del embarazo aflojarán los ligamentos de las articulaciones de la pelvis.', 6);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('problemas para dormir', 'A los cambios en los niveles hormonales, la incomodidad y la necesidad frecuente de orinar se suele sumar la alteración del sueño. Prueba a escuchar música tranquila o leer un libro si no eres capaz de dormirte. También puedes beberte un vaso de leche caliente o darte un baño antes de irte a la cama. Algunas mujeres afirman que es útil acostarse sobre el lado izquierdo, ya que mejora la circulación sanguínea. Además, puedes colocar una almohada entre las rodillas para mejorar la postura.', 6);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('calambres uterinos leves', 'Tu cuerpo está experimentando muchos cambios, por lo que es normal tener calambres. Si son intensos o van acompañados de dolor lumbar, consulta al médico para descartar problemas.', 7);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('hambre', 'Tal vez tengas más hambre que de costumbre, por lo que comerás un poco más. No obstante, recuerda que solo se recomienda ingerir aproximadamente 300 calorías más al día. Los alimentos como frutas, cereales o yogures son buenas opciones. Echa un vistazo a nuestro artículo sobre la dieta en el embarazo para obtener más consejos.', 7);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('dolor del ligamento redondo', 'De todos los síntomas del embarazo que puedas tener, este es de los más incómodos. Los ligamentos redondos se encuentran en la pelvis y ayudan a sostener el útero. A medida que el bebé crece durante el embarazo, se estiran y se ablandan. Si se tensan, es posible que sientas dolor en uno de los lados del abdomen o en ambos. Suele aparecer al cambiar de posición en la cama o al hacer ejercicio intenso. Prueba a hacer estiramientos o movimientos suaves para aliviar las molestias. Si el problema no desaparece o va acompañado de fiebre, consulta al médico.', 8);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('aumento de peso mínimo', 'Aunque la ropa te apriete un poco más, puede que hayas aumentado muy poco de peso o que incluso hayas perdido un poco si has tenido náuseas. Sigue leyendo sobre el aumento de peso en el embarazo y consulta al médico si estás preocupada. También puedes usar nuestra calculadora de aumento de peso durante el embarazo para saber cuántos kilos pueden recomendarte ganar durante el resto de este periodo.', 8);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('dolor de cabeza', 'Algunas madres padecen dolor de cabeza en algunas ocasiones. Si tienes este síntoma, túmbate en una habitación oscura y colócate una bolsa de agua fría en la cabeza o el cuello para aliviar las molestias. Consulta al médico si el dolor no desaparece o se intensifica.', 8);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('flujo vaginal', 'Es normal que tengas más flujo vaginal que de costumbre, ya que el volumen sanguíneo y los niveles hormonales aumentan durante el embarazo. El nombre técnico que recibe el flujo es «leucorrea». Suele ser de color claro e inodoro. Consulta al médico si notas olor fuerte, cambios de color, picor o sangrado en la zona vaginal.', 8);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('crecimiento de los pechos', 'Es posible que tus pechos sean un poco más grandes en este punto, aunque todavía pueden crecer más a medida que avance el embarazo. Esto puede deberse al aumento de las glándulas mamarias antes de la lactancia. Es posible que el tejido mamario llegue a pesar 1,3 kg más durante el transcurso del embarazo.', 9);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('línea negra en el abdomen', 'Puede que aparezca una línea larga y oscura en el centro de tu tripa. Se llama linea nigra o línea del embarazo y se asocia a los cambios hormonales. Suele desaparecer después de dar a luz.', 9);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('calambres en las piernas', 'Es posible que sientas calambres dolorosos en las piernas, sobre todo por la noche. Esto puede provocar que no duermas bien. Los estiramientos y el ejercicio pueden aliviar las molestias. A veces, el déficit de minerales puede contribuir a la aparición de calambres en las piernas, por lo que tu dieta debe aportarte suficientes cantidades de calcio y magnesio. Bebe agua siempre que puedas para mantenerte hidratada.', 9);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('encías sensibles y sangrado', 'A medida que aumentan el volumen sanguíneo y los niveles hormonales, es posible que las encías comiencen a hincharse y se vuelvan más sensibles. De hecho, pueden sangrar al cepillarte los dientes o usar hilo dental. Aunque esto puede ser molesto, es completamente normal. Sigue cepillándote los dientes y usando hilo dental de forma regular. Consulta al dentista si es necesario para asegurarte de que todo esté bien. Puedes comprar un cepillo de dientes más suave y enjuagarte con agua y sal (es decir, una cucharadita de sal disuelta en una taza de agua tibia).', 10);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('mareos', 'Durante el embarazo el cuerpo genera más vasos sanguíneos y los niveles hormonales cambian. Esto puede hacerte sentir mareada de vez en cuando. Usa ropa suelta, mantente hidratada, evita estar de pie mucho tiempo y come de forma regular para sentirte mejor. Además, te recomendamos levantarte despacio si has estado sentada y no cambiar de posición bruscamente. Consulta al médico si tienes dolor abdominal o sangrado vaginal y el mareo no desaparece.', 10);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('sensibilidad a los olores', 'El olfato puede ser especialmente sensible durante esta etapa del embarazo. Si te molestan algunos olores, intenta comer alimentos fríos o a temperatura ambiente para evitar olores fuertes, usa un ventilador mientras cocinas y pide a otra persona que saque la basura.', 10);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('cambios en el deseo sexual', 'Es normal que tu pareja y tú sintáis un aumento o una disminución del deseo sexual en varios momentos de estos meses. Si tienes un embarazo normal y ambos queréis hacerlo, disfrutad de vuestra intimidad. No te preocupes por el bebé, ya que no le pasará nada. El útero y el saco amniótico lo protegen. Consulta al médico si tienes dudas sobre esto o sobre otras cosas. Ten en cuenta que puede recomendarte no tener relaciones sexuales si hay complicaciones, como un historial de aborto espontáneo o riesgo de parto prematuro.', 11);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('acidez', 'La acidez y la indigestión pueden aparecer en cualquier momento del embarazo, ya que el bebé cambia de posición y el útero ejerce cada vez más presión sobre el estómago. Las hormonas del embarazo también hacen que el músculo de la parte superior del estómago se relaje, lo que permite que el ácido suba por el esófago y cause acidez. Es más probable que suceda esto si te acuestas después de haber comido mucho. Siéntate erguida después de comer y evita posibles desencadenantes (por ejemplo, el chocolate, los cítricos y los alimentos fritos o picantes) para aliviar las molestias.', 11);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('estreñimiento', 'Otro síntoma del que las hormonas del embarazo son culpables. La progesterona y el estrógeno desempeñan una función importante en el embarazo, pero también pueden ralentizar el tránsito intestinal. Esto implica que puedes tener problemas para ir al baño. Añade más frutas, verduras y alimentos integrales a tu dieta para aumentar la ingesta de fibra. También te recomendamos tomar zumo de ciruela, beber mucha agua y hacer ejercicio de forma regular.', 11);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('fugas de calostro', 'Tal vez observes que tus pechos expulsan un líquido espeso y amarillo. Se llama calostro y es la leche que tu hijo tomará los primeros días después de que des a luz. Aunque es normal, puedes usar discos desechables o de algodón (sin forros de plástico) para absorberlo.', 11);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('congestión nasal', 'Aunque las alergias y los resfriados también sean causas comunes, lo más normal es que se trate de un síntoma del embarazo. Si tienes la nariz taponada y no puedes respirar bien, puede deberse a que la hormona progesterona aumenta la circulación sanguínea en las membranas mucosas de la nariz, lo que provoca que se hinchen. Esta enfermedad se denomina rinitis del embarazo. Lamentablemente, no puedes hacer nada para que desaparezca. No obstante, te recomendamos mantenerte hidratada, usar un humidificador o aplicar un poco de vaselina alrededor de las fosas nasales para que la zona se seque menos. Unas gotas o un enjuague con solución salina también son buenas opciones para aliviar los síntomas.', 12);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('aumento del apetito', 'Si ya no tienes náuseas, lo normal es que tu apetito aumente. Come lo que te apetezca, pero no olvides seguir una dieta equilibrada. La mayoría de las mujeres cuyo peso estaba dentro de un intervalo normal antes del embarazo solo deben ingerir 300 calorías más al día (600 si están embarazadas de gemelos). Un intervalo normal corresponde a un índice de masa corporal (IMC) entre 18,5 y 24,9.', 12);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('piernas y pies hinchados', 'Un síntoma que puedes tener es el edema, un tipo de hinchazón que se produce en los pies, en la parte inferior de las piernas o incluso en las manos y los brazos. Los pies y los tobillos suelen ser las zonas que más lo sufren. El edema aparece cuando el cuerpo retiene líquido, lo que es común durante el embarazo. Los pies hinchados también pueden deberse a la hormona relaxina, que relaja los ligamentos de los pies y hace que los huesos se expandan. Para aliviar las molestias puedes meter los pies en agua fría y ponerlos en alto.', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('dolor lumbar', ' Si te duele la espalda en la semana 15 de embarazo, no estás sola. Es un síntoma muy común. Mantén una buena postura y usa zapatos de tacón bajo para tener apoyo. El ejercicio moderado para fortalecer los músculos de la espalda también puede evitar o aliviar el dolor lumbar.', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('aumento de peso', 'Con suerte, las náuseas habrán desaparecido. Es posible que hayas recuperado el apetito y que empieces a ganar un poco más de peso. Tu pequeño no para de crecer, por lo que a las 15 semanas de embarazo puede comenzar a notarse la tripa.', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('amnesia del embarazo', '¿Se te olvidan las cosas últimamente? Esto puede deberse a los cambios hormonales, la falta de sueño o incluso el estrés. Los expertos aún no saben si el embarazo afecta de verdad a la memoria y a la agudeza mental. Si estás más despistada que de costumbre, no tienes que preocuparte, ya que a muchas madres les pasa lo mismo. Usa la tablet o el móvil para apuntarlo todo en listas o recordatorios.', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('arañas vasculares', 'Dado que el embarazo provoca cambios en la circulación y un aumento del volumen sanguíneo, es posible que se te vean venitas finas y rojas en la piel de la cara o de las piernas. Haz ejercicio y pon los pies en alto siempre que puedas para mejorar la circulación y reducir la probabilidad de que aparezcan. Sea como sea, recuerda que desaparecerán cuando des a luz.', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('infecciones del tracto urinario', 'El embarazo aumenta la propensión a padecer enfermedades del tracto urinario. Consulta al médico si sientes dolor al orinar o si siempre tienes ganas de orinar, pero sobre todo si estos síntomas van acompañados de fiebre o dolor de espalda. Te recetará antibióticos para evitar problemas más graves en la vejiga o los riñones.', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('cambios en la piel', '¿Has escuchado algo sobre el «brillo especial en el embarazo»? Este puede ser el momento en que lo notes. El aumento del volumen sanguíneo en los capilares y de la producción de sebo debido a las hormonas del embarazo puede hacer que tu piel tenga un aspecto enrojecido y húmedo. Aunque a muchas mujeres les encanta, también pueden aparecer unas manchas oscuras conocidas como melasma (suelen desaparecen después del nacimiento de tu bebé) o un brote ocasional de acné. Para controlar la situación, lávate la cara dos veces al día con un limpiador suave y agua tibia. También puedes pedir al médico o al dermatólogo que te recomiende productos aptos para embarazadas.', 14);
    
INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('hemorragia nasal', 'Durante la semana 16 de embarazo es probable que tengas hemorragias nasales. Pueden deberse al aumento del volumen sanguíneo o de los niveles hormonales. Aunque son un síntoma muy común, no son fáciles de tratar. Si quieres aliviar los síntomas, usa un humidificador, ponte vaselina en los bordes de la nariz y limpia suavemente cada fosa nasal por separado si necesitas sonarte.', 14);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('hemorroides', 'Sí, ese molesto dolor en tú ya sabes dónde. Las hemorroides son venas del recto que se han dilatado demasiado debido al aumento de volumen y flujo sanguíneo en la zona pélvica. Aunque son más frecuentes al final del embarazo, te recomendamos actuar ahora para prevenirlas. Sigue una dieta rica en fibra, bebe mucha agua y haz ejercicio con frecuencia. Si quieres aliviar las molestias, date un baño con agua tibia (sin jabón ni otros productos) y evita estar sentada durante mucho tiempo. Consulta al médico inmediatamente si tienes dolor intenso o sangrado.', 15);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('piel sensible o picor', ' Durante la semana 17 de embarazo el vientre y los pechos siguen creciendo. Esto implica que la piel se estira, por lo que pueden aparecer estrías y picor. Aunque no es posible evitar este problema, prueba a beber mucha agua y aplicarte crema hidratante mañana y noche para aliviar las molestias.', 15);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('pequeños movimientos', 'La mayoría de las mujeres sienten los movimientos de su bebé por primera vez entre las semanas 16 y 20. Tu hijo aún es pequeño, por lo que a las 18 semanas de embarazo sus movimientos serán más similares a un aleteo que a una patada en la tripa.', 16);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('dolores y molestias en la espalda', ' Los cambios hormonales y el crecimiento de la tripa pueden provocar dolores y molestias en la zona lumbar.', 16);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('dolor localizado', 'El dolor de espalda, sobre todo en la parte lumbar, es algo frecuente durante el embarazo. En la semana 21 de embarazo la tripa desplaza tu centro de gravedad y tira de la parte baja de la espalda hacia delante. Al mismo tiempo, la hormona relaxina está aflojando todas las articulaciones y ligamentos de tu cuerpo, lo que permitirá que tu pelvis se expanda cuando llegue el momento del parto.', 19);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('sofocos', 'Las hormonas del embarazo y el aumento del metabolismo pueden hacer que sientas calor y sudes. Mantente fresca. Para ello, utiliza ropa holgada y bebe mucha agua. Enciende un ventilador o el aire acondicionado e intenta estar lo más cómoda posible.', 19);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('estrías', 'A medida que el vientre crece durante el embarazo, puedes notar algunas líneas de color marrón rojizo, rosa o púrpura en la piel. Las estrías aparecen cuando la piel se estira durante un corto periodo de tiempo y pueden aparecer a lo largo del vientre, las caderas, los muslos, las nalgas y los pechos. Es posible que la piel te empiece a picar también. Aplicar crema hidratante debería ayudarte.', 19);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('palpitaciones', '¿Sabías que tu corazón bombea entre un 30 % y un 50 % más de sangre ahora que estás embarazada? En realidad, son buenas noticias, ya que tu bebé recibe más oxígeno y nutrientes a través de la placenta. Por eso, tener palpitaciones puede ser normal durante el embarazo. Si también sientes que te falta el aire o que tu corazón se acelera y tus pulsaciones no bajan, visita a tu médico lo antes posible.', 20);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('dolor de pelvis', 'Las hormonas del embarazo aflojan las articulaciones, ayudándolas a ser más flexibles. Sin embargo, esta flexibilidad puede causarte dolor. Por ello, intenta no levantar objetos pesados y evita estar de pie durante mucho tiempo. Sigue leyendo sobre el dolor de pelvis y de cadera.', 20);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('dolor o calambres abdominales', '', 20);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('sangrado de implantación', '', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('sangrado de implantación', '', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('sangrado de implantación', '', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('sangrado de implantación', '', 13);

INSERT INTO symptoms (symptom_name, symptom_description, week_id)
        VALUES ('sangrado de implantación', '', 13);*/


INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 1, 1);
    
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 2, 2);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 2, 3);