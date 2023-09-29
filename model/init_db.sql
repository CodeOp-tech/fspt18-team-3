--
-- Drop Tables
--

SET foreign_key_checks = 0;
DROP TABLE if exists users;
DROP TABLE if exists weeks;
DROP TABLE if exists symptoms;
DROP TABLE if exists weeks_symptoms;
DROP TABLE if exists advice;
DROP TABLE if exists posts;
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
    symptom_description VARCHAR(1000) NOT NULL
);

CREATE TABLE weeks_symptoms (
    week_id INT NOT NULL,
    symptom_id INT NOT NULL,
    FOREIGN KEY (week_id) REFERENCES weeks(id),
    FOREIGN KEY (symptom_id) REFERENCES symptoms(id)
);

CREATE TABLE advice (
        id INT AUTO_INCREMENT PRIMARY KEY,
        week_id INT NOT NULL,
        advice_description VARCHAR(1300) NOT NULL,
        FOREIGN KEY (week_id) REFERENCES weeks(id)
);

CREATE TABLE posts (
        id INT AUTO_INCREMENT PRIMARY KEY,
        user_id INT NOT NULL,
        week_id INT NOT NULL,
        photo VARCHAR(250) NOT NULL,
        photo_description VARCHAR(250) NOT NULL,
        date_posted DATE NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id),
        FOREIGN KEY (week_id) REFERENCES weeks(id)
)

INSERT INTO users (user_name, mail, user_password, baby_name, creation_date, weeks_pregnant, photo_url)
        VALUES ("Pepita", "mail@mail.com", "1234", "Manolito", "2023-09-13", 8, "https://i.pinimg.com/236x/5f/ff/09/5fff09ae584723513d1847cb8647e401.jpg?nii=t");

INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 3, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695065159/Pregnancy/Semana%203.jpg', 'una semilla de calabaza', 'El cigoto comenzará a subir por la trompa de Falopio en dirección al útero tras dividirse en varios grupos de células.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 4, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695065237/Pregnancy/Captura_de_pantalla_2023-09-18_212659_jmhqne.jpg', 'una semilla de calabaza', 'El óvulo fecundado se implantará en un lateral del útero y se dividirá rápidamente en capas de células. Algunas de ellas se convertirán en el embrión. Las capas de células pasarán a ser las partes del cuerpo de tu pequeño,');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 5, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695064294/Pregnancy/Captura_de_pantalla_2023-09-18_211100_s1fvgs.jpg', 'una semilla de naranja', 'Se están formando la placenta y el cordón umbilical, que enviarán oxígeno y nutrientes al embrión. Además, esta semana seguirá desarrollándose el tubo neural, que terminará siendo la columna vertebral y el cerebro del bebé.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 6, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381770/Pregnancy/semana-6_gtsvqz.png', 'una semilla de granada', 'El hito más importante de esta semana es que el tubo neural comenzará a adoptar la forma de la columna vertebral del bebé. Además, las zonas que se convertirán en los ojos y los oídos adoptarán el aspecto de protuberancias y aparecerán unos pequeños brotes que se convertirán en los brazos y las piernas. La nariz, la boca, los oídos y las orejas también comenzarán a formarse junto con los pulmones.

En la ecografía de esta semana podrá detectarse un pequeño corazón con aproximadamente 105 latidos por minuto.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 7, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381787/Pregnancy/semana-7_bq7hud.png', 'un arándano', 'Aunque el cerebro del bebé seguirá evolucionando mucho tiempo después del nacimiento, ahora se formarán las secciones básicas. A medida que avance la semana, el sistema digestivo y los pulmones también se desarrollan. Además, comenzarán a aparecer los rasgos faciales y unas pequeñas manitas en cada brazo. 

Otro hito importante de esta semana es la creación del cordón umbilical.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 8, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381809/Pregnancy/semana-8_ylysbl.png', 'una frambuesa', 'Esta semana aparecerán pequeños dedos en las manos y los pies de tu pequeño. Además, podrá flexionar los brazos a la altura de los codos y las muñecas. 

En este punto los ojos desarrollarán pigmento y se comenzarán a formar los genitales, aunque todavía es muy pronto para saber si estás esperando un niño o una niña. 

Estas características externas no son lo único que se desarrollará, ya que también lo harán los órganos internos. Cuando los intestinos estén formados, comenzarán a ocupar espacio en el cordón umbilical, ya que todavía no hay suficiente hueco en el abdomen del bebé.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 9, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381837/Pregnancy/semana-9_l6sslk.png', 'una cereza', 'Los rasgos faciales de tu bebé (ahora conocido oficialmente como feto) seguirán desarrollándose estos días. De hecho, la nariz será más prominente. Los dedos de los pies ya pueden verse claramente. 

Los órganos internos también se formarán, incluidos los sistemas digestivo y reproductivo. Esto implica que los intestinos y los testículos o los ovarios crecerán cada vez más. 

Ahora estás embarazada de nueve semanas, es posible que tu pequeño comience a moverse gracias al desarrollo muscular aunque aún no lo puedas notar.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 10, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381838/Pregnancy/semana-10_vjbonr.png', 'una fresa', 'A lo largo de estos días la cabeza de tu pequeño adoptará una forma más redonda, mientras que los órganos internos se colocarán en su sitio y comenzarán a funcionar. 

También saldrán unas pequeñas yemas en su boca, que posteriormente serán los dientes. Los dedos se harán más largos y las membranas que hay entre ellos desaparecerán. 

Los ojos, los párpados y los oídos seguirán desarrollándose, pero aún les queda un tiempo para estar completamente formados.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 11, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381840/Pregnancy/semana-11_wfl2j6.png', 'una col de Bruselas', 'Esta semana estará llena de cambios emocionantes, como el desarrollo de la cabeza o la aparición de yemas en las encías. 

Los rasgos faciales del bebé están madurando poco a poco. Las orejas se moverán hacia su posición final a los lados de la cabeza, mientras que los ojos se separarán y los párpados se mantendrán cerrados. 

Los genitales también se están formando, aunque todavía es pronto para saber si vas a tener un niño o una niña. 

En esta etapa la cabeza representa la mitad de la longitud total del cuerpo, aunque el cuerpo también crecerá significativamente durante las próximas semanas. Para respaldar este crecimiento, tu pequeño necesita más nutrientes, por lo que la placenta crece y la cantidad de glóbulos rojos aumenta.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 12, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381845/Pregnancy/semana-12_fod8pu.png', 'una fruta de la pasión', 'La semana 12 de embarazo constituye el final del primer trimestre. Los órganos vitales y el resto de partes del cuerpo de tu pequeño se colocarán en su sitio. 

Seguramente sea posible escuchar el latido del corazón de tu hijo con un dispositivo Doppler.

En este punto los párpados ya se han formado. Permanecerán ligeramente cerrados hasta finales del segundo trimestre.

Las manos se desarrollarán más que los pies, y los brazos serán más largos que las piernas. En las puntas de los dedos saldrán las uñas de manos y pies, que seguirán creciendo durante el próximo trimestre.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 13, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381846/Pregnancy/semana-13_mvblgw.png', 'una ciruela grande', 'Esta semana, los órganos de tu pequeño se formarán por completo. Los riñones producirán orina y la liberarán en el líquido amniótico, mientras que el bazo generará glóbulos rojos para transportar oxígeno por el organismo del bebé. 

Los intestinos regresarán al abdomen desde el cordón umbilical, ya que por fin hay espacio suficiente para acomodarlos. Además, algunos de los huesos más grandes, se endurecerán. Y las cuerdas vocales de tu bebé comenzarán a desarrollarse.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 14, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381845/Pregnancy/semana-14_s7weye.png', 'una nectarina', 'Tu pequeño hará algunas cosas nuevas esta semana, como mover los párpados y flexionar los brazos y las piernas. Esto le permitirá practicar la habilidad de llevarse la mano a la boca. 

Los sentidos del gusto y el olfato también se desarrollarán. Además, la piel se endurecerá. Aunque tendrás que esperar a que el bebé nazca para saber si tendrá pelo o no, en este tiempo se formarán los folículos pilosos debajo de la superficie de la piel. ');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 15, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381873/Pregnancy/semana-15_wpu6qv.png', 'un pomelo', 'Esta semana los rasgos faciales de tu pequeño se colocarán poco a poco en su sitio y las orejas bajarán a ambos lados de la cabeza. Además, también se formará el patrón capilar y comenzará a crecer el pelo. Cada bebé es diferente, por lo que algunos tendrán mucho pelo al nacer y otros, no. Lo que sí es común para todos es la capa de pelo suave y velloso llamado lanugo, que aparecerá esta semana y pronto cubrirá su cuerpecito.

Una piel delgada y traslúcida cubrirá los vasos sanguíneos, que ahora transportarán hasta 47 litros de sangre al día gracias al bombeo de su corazón en desarrollo.

Puede que aún no lo notes, pero tu hijo aumentará mucho su actividad durante estos días. De hecho, comenzará a girar y rodar en el saco amniótico.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 16, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381874/Pregnancy/semana-16_ejzvye.png', 'una manzana', 'Los músculos del bebé son cada vez más fuertes. Esta semana erguirá la cabeza y comenzará a realizar movimientos coordinados con brazos y piernas.

Otra novedad de la semana 16 de embarazo es que las orejas del bebé están más cerca de alcanzar su posición final y es posible que pueda escuchar sonidos en este punto o en las próximas semanas.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 17, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381875/Pregnancy/semana-17_lxxynz.png', 'una pera', 'Esta semana tu hijo desarrollará una capa de grasa debajo de la piel, que se irá haciendo más gruesa a medida que avance el embarazo. Esta grasa le proporciona energía y le ayuda a mantenerse caliente después de nacer. 

Las glándulas sebáceas de la piel de tu pequeño comenzarán a producir vérnix, una película blanca y grasa que protege la piel y regula la temperatura corporal. 

¿Sabías que también le están saliendo las uñas de los pies? A finales de este mes es probable que ya lleguen hasta las puntas de los dedos. De hecho, a veces hay que cortarlas tras dar a luz.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 18, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381846/Pregnancy/semana-18_bvuew8.png', 'un boniato', 'Esta semana tu bebé desarrollará una característica única: las huellas dactilares. Las almohadillas de grasa que hay en las yemas de sus dedos se convertirán en líneas arremolinadas que le distinguirán del resto.

El sistema digestivo, que seguirá formándose, ya lleva funcionando varias semanas. Tu pequeño tragará líquido amniótico, que pasará por el estómago y los intestinos, arrastrando consigo células muertas y secreciones. Todo ello se convertirá en meconio, una sustancia negra y espesa que verás cuando le cambies el pañal por primera vez.

En torno a las 18 semanas las orejas empezarán a sobresalir de los lados de la cabeza. Además, los oídos empezarán a registrar sonidos.

El bebé necesitará bilis para digerir los nutrientes que necesita, por lo que la vesícula biliar comenzará a funcionar.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 19, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381873/Pregnancy/semana-19_nw0gd1.png', 'un mango', 'Si tu bebé es una niña, su sistema reproductor terminará de desarrollarse. La vagina, el útero y las trompas de Falopio se colocarán en su sitio. Los ovarios contendrán más de seis millones de óvulos, aunque cuando nazca esa cantidad se reducirá a aproximadamente un millón. 

Si es niño, sus testículos ya estarán formados y segregarán testosterona desde la semana 10 de embarazo. No obstante, los genitales seguirán creciendo. 

En esta fase del embarazo la piel de tu pequeño comenzará a producir una capa blanquecina llamada vernix caseosa. Esta sustancia está formada por la grasa que segrega la piel, células muertas y lanugo (es decir, el vello fino que recubre el cuerpo del bebé). Su finalidad es proteger la piel del bebé del líquido amniótico en el que flota. Aunque gran parte de esta sustancia desaparecerá antes de que nazca, es habitual que los bebés prematuros aún la tengan.

En torno a la semana 19 de embarazo el bebé desarrollará unos hábitos de sueño más regulares y se despertará cuando note movimiento o ruido. También le crecerán las uñas en manos y pies. ');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 20, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381873/Pregnancy/semana-20_f66xdw.png', 'un pimiento', 'Los rasgos faciales, como la nariz, irán tomando forma. Tu pequeño ya parecerá toda una personita. El reflejo de succión mejorará hasta el punto de que comenzará a chuparse el dedo. Su cerebro seguirá formándose rápidamente, sobre todo los centros nerviosos dedicados a los sentidos. 

Poco a poco desarrollará ciclos definidos de sueño y vigilia. Además, será cada vez más sensible a los sonidos del entorno, por lo que es normal que los ruidos fuertes le despierten.

En esta etapa la piel del bebé se volverá más gruesa. También se formarán las capas de la piel, entre ellas la capa blanquecina que le protege del líquido amniótico, llamada vérnix.

En la semana 20 de embarazo el sistema digestivo de tu hijo comenzará a producir una sustancia pegajosa de color negro verdoso llamada meconio, que se acumulará en sus intestinos durante el resto del embarazo. Por lo general, la expulsará en las primeras horas de vida. ');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 21, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381875/Pregnancy/semana-21_vnkoqe.png', 'un plátano', 'Esta semana el latido del corazón de tu bebé ya es lo suficientemente fuerte como para escucharlo con un simple estetoscopio, pero puede ser difícil distinguirlo de tu propio latido. Escucha el ritmo más rápido: el latido del bebé es de 120 a 160 latidos por minuto, aproximadamente el doble de rápido que el tuyo.

Tu bebé ya está empezando a dormir y a despertarse en ciclos sutiles. Las ecografías muestran que los bebés que aún no han nacido pueden incluso adoptar una posición favorita para dormir.

En torno a la semana 21 de embarazo, los dedos de las manos y de los pies ya se han formado completamente. 

El sistema digestivo de tu bebé se está desarrollando. El pequeño ya es capaz de tragar pequeñas cantidades de líquido amniótico, que pueden absorber los intestinos. Su pequeño hígado y su bazo han estado produciendo células sanguíneas, pero ahora la médula ósea también puede crearlas. El hígado y el bazo dejarán de producir estas células sanguíneas antes del nacimiento.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 22, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381894/Pregnancy/semana-22_scxsrs.png', 'una papaya', 'En la semana 22 de embarazo los párpados de tu bebé aún no están separados, pero los ojos empiezan a moverse. Los conductos lagrimales también se están formando y las cejas de tu bebé son pequeños mechones de pelo blanco y fino. Incluso es posible que frunza esas pequeñas cejas. Además, cada vez es más sensible a los estímulos externos.

El cerebro de tu bebé se está desarrollando rápidamente y se están formando las terminaciones nerviosas. A estas alturas el bebé ya ha desarrollado el sentido del tacto, lo que significa que puede acariciar una parte de su cuerpo a la que llegue por casualidad o chuparse el dedo. Además, está empezando a acumular capas de lo que se denomina grasa parda, que lo ayuda a mantenerse caliente.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 23, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381874/Pregnancy/semana-23_j6ser0.png', 'una berenjena', 'En la semana 23 de embarazo es probable que tu bebé duerma mucho. La mayor parte de sus horas de sueño (en realidad, el 80 %) las pasará en lo que se denomina sueño de movimientos oculares rápidos o sueño MOR. Durante el sueño MOR, los ojos de tu bebé se mueven y su cerebro está muy activo.

Puede que no hayas pensado demasiado en el líquido que rodea a tu bebé en el saco amniótico, pero en realidad desempeña un papel muy importante: crea el entorno perfecto para que tu bebé se convierta en un recién nacido sano. El líquido ayuda a mantenerlo caliente y protegido mientras crece.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 24, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381896/Pregnancy/semana-24_mv5anc.png', 'una mazorca de maíz', 'A las 24 semanas el oído interno de tu bebé está completamente desarrollado. Este órgano controla su sentido del equilibrio y le ayuda a percibir si está o no boca arriba en el útero. 

Aunque los pulmones de tu bebé ya están formados, no podrán funcionar con normalidad en el mundo exterior hasta que empiecen a producir una sustancia llamada surfactante, lo que tendrá lugar en las próximas semanas, en torno a la semana 26 de embarazo.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 25, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381875/Pregnancy/semana-25_oxocyr.png', 'una calabaza pequeña', 'En la semana 25 de embarazo el bebé está empezando a engordar. Al estar ganando grasa cada día, las arrugas de la piel se le están suavizando. 

En el cerebro del bebé, el córtex está formando capas. La mayor parte de la acción sigue estando controlada por otras zonas cerebrales desarrolladas mucho antes. Además del cerebro, hay otras partes del sistema nervioso aún en desarrollo. Este importante sistema es el que ayudará a tu bebé a aprender a recibir información del mundo exterior, así como a procesarla y a reaccionar.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 26, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381876/Pregnancy/semana-26_exeodp.png', 'un calabacín', 'En la semana 26 de embarazo, los pulmones de tu bebé están trabajando duro y preparándose para sus primeras respiraciones tras el nacimiento. Están empezando a producir surfactante, una sustancia que ayuda a los pulmones a inflarse correctamente con cada respiración.
        
        La piel del bebé está empezando a tomar un color rojizo, aunque todavía es un poco translúcida. Le sigue creciendo pelo en la cabeza y también empiezan a salirle las pestañas.
        
        Si esperas con impaciencia el día en que puedas mirar a los ojos a tu recién nacido, debes saber que ya has recorrido más de la mitad del camino. Aunque los ojos de tu bebé han estado cerrados hasta este momento, pronto se abrirán y podrán parpadear.
        
        En la semana 26 de embarazo la posición del bebé puede cambiar de vez en cuando y en las siguientes semanas será importante que prestes atención a la frecuencia de sus movimientos. Tu médico te ofrecerá más información sobre cómo hacerlo.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 27, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381878/Pregnancy/semana-27_hgormq.png', 'una coliflor', 'Tu bebé está trabajando en sus patadas y estiramientos, y está empezando a hacer movimientos de agarre. También está empezando a sonreír, sobre todo cuando duerme. Y aún hay más: después de haber estado cerrados durante más de cuatro meses, los párpados de tu bebé pueden volver a abrirse. Tu pequeño puede ver las luces y sombras a su alrededor. 

Es posible que empiece a reconocer voces familiares, sobre todo la tuya. Al oír tu voz, su ritmo cardíaco puede disminuir, lo que significa que está tranquilo y relajado. 

Sus pequeños pulmones e hígado y su sistema inmunitario todavía tienen que desarrollarse por completo, pero está ganando peso y grasa de forma constante. En este momento, tu bebé se parece al bebé completamente formado que vas a ver al nacer, solo que más pequeño.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 28, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381891/Pregnancy/semana-28_uldpyp.png', 'una lechuga', 'Con los ojos abiertos, tu bebé ya es capaz de distinguir la luz de la oscuridad. Incluso puede girarse o moverse como reacción a los cambios de luz. 

Su cerebro aún se está desarrollando, pero el sistema nervioso central se ha desarrollado lo suficiente como para permitirle empezar a controlar su temperatura corporal.

En la semana 28 de embarazo la posición de tu bebé dentro del útero puede ser con la cabeza hacia abajo, o con las nalgas, los pies o ambos apuntando hacia abajo. En este caso, se dice que el bebé está de nalgas.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 29, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381894/Pregnancy/semana-29_n1k3en.png', 'una calabaza mediana', 'Ha comenzado a ganar peso más rápidamente. Durante los últimos meses del embarazo seguirá engordando y probablemente duplicará su peso actual. 

Aunque la mayor parte del cuerpo y los órganos se han desarrollado casi por completo, es posible que los pulmones no estén completamente listos para salir del útero.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 30, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381896/Pregnancy/semana-30_vtmrkm.png', 'un repollo', 'Tu pequeño está acumulando grasa, por lo que su piel parecerá menos arrugada. Esta grasa le mantendrá caliente cuando nazca.

El vello fino que cubre su piel, llamado lanugo, desaparecerá en esta etapa. Cuando el bebé nazca, te darás cuenta de la cantidad de lanugo que ha perdido, sobre todo si le queda un poco en los hombros, la espalda o las orejas.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 31, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381890/Pregnancy/semana-31_ihfnxa.png', 'un coco', 'La mayoría de los huesos del bebé se endurecerán, pero el cráneo seguirá siendo blando y flexible para que pueda pasar fácilmente por el canal de parto cuando llegue el momento. 

Tu pequeño tendrá unos puntos blandos en su cráneo al nacer, llamados fontanelas. Una de ellas se endurecerá a los pocos meses de nacer, mientras que las otras se cerrarán aproximadamente a los 18 meses.  

También habrá otras novedades en la semana 31 de embarazo. El cerebro del bebé está madurando rápidamente. Empezará a regular su propia temperatura corporal, lo que significa que ya no depende totalmente del líquido amniótico para calentarse.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 32, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381894/Pregnancy/semana-32_qqeogt.png', 'una col china', 'El feto se parece cada vez más al bebé que conocerás en unas semanas.Es posible que tu bebé se ponga de pie sobre la cabeza estos días. La mayoría de los bebés pasan a tener la cabeza hacia abajo unas semanas antes de nacer. No te sorprendas si decide cambiar de posición varias veces antes de nacer. Notarás cómo se mueve en la tripa mientras da vueltas.
        
        Cada vez se forma más grasa bajo la piel del bebé, que ahora será opaca. Además, las uñas de los pies han crecido y ya son visibles.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 33, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381894/Pregnancy/semana-33_ze5upl.png', 'una piña', 'En este momento del embarazo el cerebro del bebé no parará de recibir estímulos de los cinco sentidos. Puede oír e incluso ver algo de lo que ocurre fuera del útero. Cuando oiga tu voz, su ritmo cardíaco disminuirá, lo que significa que está más tranquilo. También será capaz de distinguir la luz de la oscuridad en su pequeño entorno. De hecho, sus ojos están lo suficientemente desarrollados como para que las pupilas respondan a los cambios de luz. 

Tu hijo ganará más peso (y lo seguirá haciendo hasta la fecha de parto). Sin embargo, es probable que no crezca mucho más.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 34, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381832/Pregnancy/semana-34_rwtkcc.png', 'un melón pequeño', 'Durante la semana 34 de embarazo el bebé seguirá creciendo, por lo que tendrá menos espacio para girar en el útero. En consecuencia, puede que notes movimientos más suaves. 

En esta etapa tu pequeño descenderá más por la pelvis, lo que indica que queda poco para su llegada al mundo. En los próximos días, si te haces una ecografía o acudes al médico, tal vez descubras que se ha colocado con la cabeza hacia abajo como preparación para el parto. 

¿Quieres saber qué color de ojos tendrá el bebé cuando nazca? Dependerá de la cantidad de melanina. Los bebés que nacen con poco pigmento o sin él tienen los ojos azules, aunque el color puede cambiar durante los primeros dos años de vida. Si tu hijo tiene los ojos más oscuros al nacer, lo más seguro es que se queden así.

Si esperas un niño, puede que los testículos ya estén en el escroto. A veces, estos no descienden hasta el nacimiento. Si es tu caso, es probable que los testículos caigan cuando el bebé tenga seis meses.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 35, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381833/Pregnancy/semana-35_ca6coc.png', 'un melón grande', 'En esta semana los brazos y las piernas del bebé engordarán y su piel se volverá más rosada y suave. 

Los pulmones comenzarán a producir surfactante. Esta sustancia ayuda a que funcionen correctamente y puedan tomar aire cuando esté fuera del útero. 

El cerebro y el sistema nervioso del bebé seguirán desarrollándose. En este momento el cerebro del bebé pesará aproximadamente dos tercios de lo que pesará cuando estés en la semana de embarazo 39 o 40, cuando se considera que el embarazo ya ha llegado a término. 

En la semana 35 de embarazo los sistemas circulatorio y musculoesquelético estarán completamente desarrollados, por lo que el bebé podrá colocarse con la cabeza hacia abajo como preparación para el parto.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 36, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381832/Pregnancy/semana-36_monnbj.png', 'una lechuga romana', 'En el momento del parto, los huesos de su cráneo se habrán desarrollado, pero aún no se habrán fusionado. Esto significa que pueden moverse para que la cabeza y el cuerpo pasen por el cuello uterino y la pelvis con mayor facilidad. 

Por ello, si tienes un parto vaginal, la cabeza de tu hijo podrá estar ligeramente deformada cuando nazca. No obstante, volverá a tener una forma más normal y redondeada después de unos días. Los huesos del cráneo se fusionarán a lo largo de los dos primeros años de vida.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 37, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381833/Pregnancy/semana-37_thbp6s.png', 'una acelga', 'Aunque quede un poco para la fecha de parto, se considera que el embarazo ya ha llegado a término temprano. Para llegar a término completo tendrás que esperar a la semana 39. 

En cuanto al desarrollo, el bebé perderá la mayor parte del lanugo, que es el vello corporal fino que cubre su cuerpo mientras está en el útero. También hará movimientos de agarre con los dedos y responderá a las luces brillantes del exterior con movimientos o giros. 

Si aún no lo ha hecho, es posible que se coloque con la cabeza hacia abajo como preparación para el parto.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 38, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381833/Pregnancy/semana-38_ydy7k3.png', 'un ruibarbo', 'Cuando el bebé nazca, sus primeras deposiciones se llamarán meconio. Esta sustancia pegajosa de color negro verdoso comienza a acumularse en sus intestinos mientras está en el útero. Se forma a partir de materiales de desecho como las células muertas de la piel y el lanugo, que es el vello corporal fino que se desprende.  

Aunque todavía faltan un par de semanas para la fecha de parto prevista, el bebé puede llegar en cualquier momento. Recuerda que solo el 4 % de las madres dan a luz el día que estima el médico.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 39, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381834/Pregnancy/semana-39_kg9nca.png', 'una sandía', 'El embarazo por fin ha llegado a término completo. El final del tercer trimestre está cada vez más cerca. 

Los pulmones y el cerebro del bebé seguirán desarrollándose después del nacimiento. De hecho, el cerebro no alcanzará su tamaño completo hasta que cumpla dos años y los pulmones no madurarán hasta los tres. En estos días los pulmones fabricarán surfactante para evitar que los alvéolos se queden pegados cuando respire por primera vez.');
INSERT INTO weeks (week_number, baby_image, baby_size, baby_development)
        VALUES ( 40, 'https://res.cloudinary.com/dgv68zde9/image/upload/v1695381836/Pregnancy/semana-40_vpeftu.png', 'una calabaza grande', 'En la semana 40 de embarazo tu pequeño podría llegar cualquier día, pero también quedarse un tiempo más en la tripa. Si no te pones de parto una semana antes de la fecha prevista, el médico controlará el ritmo cardíaco y los movimientos del bebé para asegurarse de que todo va bien. 

Puede que la cabeza de tu hijo haya descendido por la pelvis y su cuerpo esté encogido. Tampoco tiene más opciones, ya que está muy apretado ahí dentro. Si está de nalgas, el 
médico puede intentar girarlo ejerciendo una presión firme sobre tu abdomen. Si esto no funciona, puede comentarte la posibilidad de realizar una cesárea. 

El cuerpo del bebé genera cada vez más grasa para poder adaptarse a la vida fuera del útero. Además, el hígado, los pulmones y el cerebro siguen desarrollándose.');



INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('sangrado de implantación', 'Aparición de unas manchitas cuando los blastocistos (es decir, los grupos de células que hemos dicho antes) se fijan en el endometrio. Este sangrado es totalmente normal y se puede confundir con la regla.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('hinchazón en la tripa', 'Tu cuerpo se está preparando para un bebé que crecerá rápidamente durante los próximos meses. No te sorprendas si se te hincha la tripa, sobre todo la zona del abdomen. Esto se debe a que el endometrio es cada vez más grueso, por lo que ocupa más espacio que de costumbre. ');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('manchado o sangrado leve', 'Algunas mujeres observan unas manchitas en la ropa interior durante la cuarta semana de embarazo, lo que se conoce como sangrado de implantación.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('cambios de humor', 'Otro síntoma que puedes notar en la cuarta semana de embarazo son los cambios de humor. Estas emociones extremas, que se deben al aumento de los niveles hormonales, pueden ser muy potentes durante el primer y tercer trimestre. Haz ejercicios de relajación, date masajes, descansa y sigue una dieta equilibrada para sentirte mejor.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('sensibilidad en los pechos', 'Al igual que el abdomen, los pechos se están preparando para alimentar al bebé cuando nazca. Como aumentan la cantidad de glándulas mamarias y el grosor de la capa de grasa, tus pechos se verán más grandes.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('naúseas', 'Durante la cuarta semana de embarazo puede que tengas náuseas, que provocan una sensación de mareo a cualquier hora del día. Este problema es diferente según la mujer, ya que algunas se marean cuando se levantan y otras incluso llegan a vomitar. Si las padeces, no estás sola, ya que aproximadamente el 85 % de las mujeres experimentan algún tipo de náuseas en el embarazo. Además, la buena noticia es que suelen desaparecer durante el segundo trimestre.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('flujo de color claro', 'Durante la cuarta semana de embarazo es normal que tengas más flujo vaginal que de costumbre. Debe ser pegajoso y de color claro o blanco. Si huele mal y notas escozor o picor en la zona de la vagina, consulta al médico.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('fatiga', 'No es de extrañar que te sientas cansada, y esto solo acaba de empezar. Tu cuerpo está trabajando contra reloj para proteger al bebé y los niveles de hormona progesterona están aumentando, lo que supone un desgaste considerable. La fatiga forma parte del embarazo, pero también puede ser un síntoma de falta de hierro. Te recomendamos preguntar al médico sobre la ingesta de hierro, ya que un suplemento puede prevenir la anemia y la sensación de sopor.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('necesidad frecuente de orinar', 'La necesidad frecuente de orinar puede aparecer en cualquier momento, sobre todo cuando los riñones comienzan a filtrar más líquido debido al aumento del volumen sanguíneo. Aunque este síntoma puede ser molesto, es completamente normal.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('acné', ' Los cambios hormonales pueden ser los culpables del acné que aparezca como consecuencia del embarazo. Lee sobre acné del embarazo para saber cómo combatir las manchas y las imperfecciones. Recuerda que, sea como sea, lo más probable es que desaparezca cuando nazca el bebé.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('síntomas leves o inexistentes', '¿Pasa algo si no tienes síntomas a las cinco semanas de embarazo? Es normal que algunas mujeres se sientan completamente normales en esta etapa o experimenten síntomas pasajeros. En cuanto a la tripa, puede que no haya cambiado o que esté un poco hinchada. Si tienes náuseas graves, puede que pierdas un poco de peso durante el primer trimestre. Consulta al médico si tienes dudas sobre los cambios que estás experimentando o si la falta de síntomas te hace sentir incómoda.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('calambres', 'Durante la sexta semana de embarazo es normal tener calambres leves. Es una señal de que tu útero se está expandiendo para que quepa tu hijo. Si sientes un dolor más intenso que el de los calambres menstruales y tienes fiebre o diarrea, consulta al médico inmediatamente.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('exceso de salivación', 'Puedes notar más saliva que de costumbre, a menudo acompañada de náuseas o vómitos. Puede parecerte raro, pero solo es otro síntoma del embarazo más para muchas mujeres.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('antojos o aversión a los alimentos', 'Las preferencias alimentarias y la tolerancia a los olores pueden cambiar durante el embarazo, lo que se debe probablemente a las hormonas. Si sientes ganas de comer cosas que no sean alimentos, como tierra o tiza, consulta inmediatamente al médico.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('diarrea', 'Ya sabemos que no necesitas más motivos para ir al baño, pero aquí hay otro. Durante la séptima semana es normal tener diarrea. De hecho, es uno de los síntomas gastrointestinales que puedes experimentar debido a los cambios hormonales, como el estreñimiento o la indigestión. Añade alimentos como puré de manzana, avena y plátanos a la dieta para absorber el exceso de agua y mantenerte hidratada, ya que la diarrea puede provocar deshidratación.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor de espalda', 'Si estás embarazada de ocho semanas, puede dolerte la espalda a la altura de las vértebras lumbares. Esto se debe a que los músculos de la espalda deben trabajar un poco más que de costumbre, ya que tu peso se redistribuye para adaptarse al tamaño del útero. Además, tu centro de gravedad cambiará y las hormonas del embarazo aflojarán los ligamentos de las articulaciones de la pelvis.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('problemas para dormir', 'A los cambios en los niveles hormonales, la incomodidad y la necesidad frecuente de orinar se suele sumar la alteración del sueño. Prueba a escuchar música tranquila o leer un libro si no eres capaz de dormirte. También puedes beberte un vaso de leche caliente o darte un baño antes de irte a la cama. Algunas mujeres afirman que es útil acostarse sobre el lado izquierdo, ya que mejora la circulación sanguínea. Además, puedes colocar una almohada entre las rodillas para mejorar la postura.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('calambres uterinos leves', 'Tu cuerpo está experimentando muchos cambios, por lo que es normal tener calambres. Si son intensos o van acompañados de dolor lumbar, consulta al médico para descartar problemas.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('hambre', 'Tal vez tengas más hambre que de costumbre, por lo que comerás un poco más. No obstante, recuerda que solo se recomienda ingerir aproximadamente 300 calorías más al día. Los alimentos como frutas, cereales o yogures son buenas opciones. Echa un vistazo a nuestro artículo sobre la dieta en el embarazo para obtener más consejos.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor del ligamento redondo', 'De todos los síntomas del embarazo que puedas tener, este es de los más incómodos. Los ligamentos redondos se encuentran en la pelvis y ayudan a sostener el útero. A medida que el bebé crece durante el embarazo, se estiran y se ablandan. Si se tensan, es posible que sientas dolor en uno de los lados del abdomen o en ambos. Suele aparecer al cambiar de posición en la cama o al hacer ejercicio intenso. Prueba a hacer estiramientos o movimientos suaves para aliviar las molestias. Si el problema no desaparece o va acompañado de fiebre, consulta al médico.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('aumento de peso mínimo', 'Aunque la ropa te apriete un poco más, puede que hayas aumentado muy poco de peso o que incluso hayas perdido un poco si has tenido náuseas. Sigue leyendo sobre el aumento de peso en el embarazo y consulta al médico si estás preocupada. También puedes usar nuestra calculadora de aumento de peso durante el embarazo para saber cuántos kilos pueden recomendarte ganar durante el resto de este periodo.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor de cabeza', 'Algunas madres padecen dolor de cabeza en algunas ocasiones. Si tienes este síntoma, túmbate en una habitación oscura y colócate una bolsa de agua fría en la cabeza o el cuello para aliviar las molestias. Consulta al médico si el dolor no desaparece o se intensifica.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('flujo vaginal', 'Es normal que tengas más flujo vaginal que de costumbre, ya que el volumen sanguíneo y los niveles hormonales aumentan durante el embarazo. El nombre técnico que recibe el flujo es «leucorrea». Suele ser de color claro e inodoro. Consulta al médico si notas olor fuerte, cambios de color, picor o sangrado en la zona vaginal.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('crecimiento de los pechos', 'Es posible que tus pechos sean un poco más grandes en este punto, aunque todavía pueden crecer más a medida que avance el embarazo. Esto puede deberse al aumento de las glándulas mamarias antes de la lactancia. Es posible que el tejido mamario llegue a pesar 1,3 kg más durante el transcurso del embarazo.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('línea negra en el abdomen', 'Puede que aparezca una línea larga y oscura en el centro de tu tripa. Se llama linea nigra o línea del embarazo y se asocia a los cambios hormonales. Suele desaparecer después de dar a luz.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('calambres en las piernas', 'Es posible que sientas calambres dolorosos en las piernas, sobre todo por la noche. Esto puede provocar que no duermas bien. Los estiramientos y el ejercicio pueden aliviar las molestias. A veces, el déficit de minerales puede contribuir a la aparición de calambres en las piernas, por lo que tu dieta debe aportarte suficientes cantidades de calcio y magnesio. Bebe agua siempre que puedas para mantenerte hidratada.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('encías sensibles y sangrado', 'A medida que aumentan el volumen sanguíneo y los niveles hormonales, es posible que las encías comiencen a hincharse y se vuelvan más sensibles. De hecho, pueden sangrar al cepillarte los dientes o usar hilo dental. Aunque esto puede ser molesto, es completamente normal. Sigue cepillándote los dientes y usando hilo dental de forma regular. Consulta al dentista si es necesario para asegurarte de que todo esté bien. Puedes comprar un cepillo de dientes más suave y enjuagarte con agua y sal (es decir, una cucharadita de sal disuelta en una taza de agua tibia).');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('mareos', 'Durante el embarazo el cuerpo genera más vasos sanguíneos y los niveles hormonales cambian. Esto puede hacerte sentir mareada de vez en cuando. Usa ropa suelta, mantente hidratada, evita estar de pie mucho tiempo y come de forma regular para sentirte mejor. Además, te recomendamos levantarte despacio si has estado sentada y no cambiar de posición bruscamente. Consulta al médico si tienes dolor abdominal o sangrado vaginal y el mareo no desaparece.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('sensibilidad a los olores', 'El olfato puede ser especialmente sensible durante esta etapa del embarazo. Si te molestan algunos olores, intenta comer alimentos fríos o a temperatura ambiente para evitar olores fuertes, usa un ventilador mientras cocinas y pide a otra persona que saque la basura.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('cambios en el deseo sexual', 'Es normal que tu pareja y tú sintáis un aumento o una disminución del deseo sexual en varios momentos de estos meses. Si tienes un embarazo normal y ambos queréis hacerlo, disfrutad de vuestra intimidad. No te preocupes por el bebé, ya que no le pasará nada. El útero y el saco amniótico lo protegen. Consulta al médico si tienes dudas sobre esto o sobre otras cosas. Ten en cuenta que puede recomendarte no tener relaciones sexuales si hay complicaciones, como un historial de aborto espontáneo o riesgo de parto prematuro.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('acidez', 'La acidez y la indigestión pueden aparecer en cualquier momento del embarazo, ya que el bebé cambia de posición y el útero ejerce cada vez más presión sobre el estómago. Las hormonas del embarazo también hacen que el músculo de la parte superior del estómago se relaje, lo que permite que el ácido suba por el esófago y cause acidez. Es más probable que suceda esto si te acuestas después de haber comido mucho. Siéntate erguida después de comer y evita posibles desencadenantes (por ejemplo, el chocolate, los cítricos y los alimentos fritos o picantes) para aliviar las molestias.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('estreñimiento', 'Otro síntoma del que las hormonas del embarazo son culpables. La progesterona y el estrógeno desempeñan una función importante en el embarazo, pero también pueden ralentizar el tránsito intestinal. Esto implica que puedes tener problemas para ir al baño. Añade más frutas, verduras y alimentos integrales a tu dieta para aumentar la ingesta de fibra. También te recomendamos tomar zumo de ciruela, beber mucha agua y hacer ejercicio de forma regular.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('fugas de calostro', 'Tal vez observes que tus pechos expulsan un líquido espeso y amarillo. Se llama calostro y es la leche que tu hijo tomará los primeros días después de que des a luz. Aunque es normal, puedes usar discos desechables o de algodón (sin forros de plástico) para absorberlo.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('congestión nasal', 'Aunque las alergias y los resfriados también sean causas comunes, lo más normal es que se trate de un síntoma del embarazo. Si tienes la nariz taponada y no puedes respirar bien, puede deberse a que la hormona progesterona aumenta la circulación sanguínea en las membranas mucosas de la nariz, lo que provoca que se hinchen. Esta enfermedad se denomina rinitis del embarazo. Lamentablemente, no puedes hacer nada para que desaparezca. No obstante, te recomendamos mantenerte hidratada, usar un humidificador o aplicar un poco de vaselina alrededor de las fosas nasales para que la zona se seque menos. Unas gotas o un enjuague con solución salina también son buenas opciones para aliviar los síntomas.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('aumento del apetito', 'Si ya no tienes náuseas, lo normal es que tu apetito aumente. Come lo que te apetezca, pero no olvides seguir una dieta equilibrada. La mayoría de las mujeres cuyo peso estaba dentro de un intervalo normal antes del embarazo solo deben ingerir 300 calorías más al día (600 si están embarazadas de gemelos). Un intervalo normal corresponde a un índice de masa corporal (IMC) entre 18,5 y 24,9.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('piernas y pies hinchados', 'Un síntoma que puedes tener es el edema, un tipo de hinchazón que se produce en los pies, en la parte inferior de las piernas o incluso en las manos y los brazos. Los pies y los tobillos suelen ser las zonas que más lo sufren. El edema aparece cuando el cuerpo retiene líquido, lo que es común durante el embarazo. Los pies hinchados también pueden deberse a la hormona relaxina, que relaja los ligamentos de los pies y hace que los huesos se expandan. Para aliviar las molestias puedes meter los pies en agua fría y ponerlos en alto.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor lumbar', ' Si te duele la espalda en la semana 15 de embarazo, no estás sola. Es un síntoma muy común. Mantén una buena postura y usa zapatos de tacón bajo para tener apoyo. El ejercicio moderado para fortalecer los músculos de la espalda también puede evitar o aliviar el dolor lumbar.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('aumento de peso', 'Con suerte, las náuseas habrán desaparecido. Es posible que hayas recuperado el apetito y que empieces a ganar un poco más de peso. Tu pequeño no para de crecer, por lo que a las 15 semanas de embarazo puede comenzar a notarse la tripa.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('amnesia del embarazo', '¿Se te olvidan las cosas últimamente? Esto puede deberse a los cambios hormonales, la falta de sueño o incluso el estrés. Los expertos aún no saben si el embarazo afecta de verdad a la memoria y a la agudeza mental. Si estás más despistada que de costumbre, no tienes que preocuparte, ya que a muchas madres les pasa lo mismo. Usa la tablet o el móvil para apuntarlo todo en listas o recordatorios.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('arañas vasculares', 'Dado que el embarazo provoca cambios en la circulación y un aumento del volumen sanguíneo, es posible que se te vean venitas finas y rojas en la piel de la cara o de las piernas. Haz ejercicio y pon los pies en alto siempre que puedas para mejorar la circulación y reducir la probabilidad de que aparezcan. Sea como sea, recuerda que desaparecerán cuando des a luz.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('infecciones del tracto urinario', 'El embarazo aumenta la propensión a padecer enfermedades del tracto urinario. Consulta al médico si sientes dolor al orinar o si siempre tienes ganas de orinar, pero sobre todo si estos síntomas van acompañados de fiebre o dolor de espalda. Te recetará antibióticos para evitar problemas más graves en la vejiga o los riñones.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('cambios en la piel', '¿Has escuchado algo sobre el «brillo especial en el embarazo»? Este puede ser el momento en que lo notes. El aumento del volumen sanguíneo en los capilares y de la producción de sebo debido a las hormonas del embarazo puede hacer que tu piel tenga un aspecto enrojecido y húmedo. Aunque a muchas mujeres les encanta, también pueden aparecer unas manchas oscuras conocidas como melasma (suelen desaparecen después del nacimiento de tu bebé) o un brote ocasional de acné. Para controlar la situación, lávate la cara dos veces al día con un limpiador suave y agua tibia. También puedes pedir al médico o al dermatólogo que te recomiende productos aptos para embarazadas.');
    
INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('hemorragia nasal', 'Durante la semana 16 de embarazo es probable que tengas hemorragias nasales. Pueden deberse al aumento del volumen sanguíneo o de los niveles hormonales. Aunque son un síntoma muy común, no son fáciles de tratar. Si quieres aliviar los síntomas, usa un humidificador, ponte vaselina en los bordes de la nariz y limpia suavemente cada fosa nasal por separado si necesitas sonarte.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('hemorroides', 'Sí, ese molesto dolor en tú ya sabes dónde. Las hemorroides son venas del recto que se han dilatado demasiado debido al aumento de volumen y flujo sanguíneo en la zona pélvica. Aunque son más frecuentes al final del embarazo, te recomendamos actuar ahora para prevenirlas. Sigue una dieta rica en fibra, bebe mucha agua y haz ejercicio con frecuencia. Si quieres aliviar las molestias, date un baño con agua tibia (sin jabón ni otros productos) y evita estar sentada durante mucho tiempo. Consulta al médico inmediatamente si tienes dolor intenso o sangrado.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('piel sensible o picor', ' Durante la semana 17 de embarazo el vientre y los pechos siguen creciendo. Esto implica que la piel se estira, por lo que pueden aparecer estrías y picor. Aunque no es posible evitar este problema, prueba a beber mucha agua y aplicarte crema hidratante mañana y noche para aliviar las molestias.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('pequeños movimientos', 'La mayoría de las mujeres sienten los movimientos de su bebé por primera vez entre las semanas 16 y 20. Tu hijo aún es pequeño, por lo que a las 18 semanas de embarazo sus movimientos serán más similares a un aleteo que a una patada en la tripa.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolores y molestias en la espalda', ' Los cambios hormonales y el crecimiento de la tripa pueden provocar dolores y molestias en la zona lumbar.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor localizado', 'El dolor de espalda, sobre todo en la parte lumbar, es algo frecuente durante el embarazo. En la semana 21 de embarazo la tripa desplaza tu centro de gravedad y tira de la parte baja de la espalda hacia delante. Al mismo tiempo, la hormona relaxina está aflojando todas las articulaciones y ligamentos de tu cuerpo, lo que permitirá que tu pelvis se expanda cuando llegue el momento del parto.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('sofocos', 'Las hormonas del embarazo y el aumento del metabolismo pueden hacer que sientas calor y sudes. Mantente fresca. Para ello, utiliza ropa holgada y bebe mucha agua. Enciende un ventilador o el aire acondicionado e intenta estar lo más cómoda posible.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('estrías', 'A medida que el vientre crece durante el embarazo, puedes notar algunas líneas de color marrón rojizo, rosa o púrpura en la piel. Las estrías aparecen cuando la piel se estira durante un corto periodo de tiempo y pueden aparecer a lo largo del vientre, las caderas, los muslos, las nalgas y los pechos. Es posible que la piel te empiece a picar también. Aplicar crema hidratante debería ayudarte.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('palpitaciones', '¿Sabías que tu corazón bombea entre un 30 % y un 50 % más de sangre ahora que estás embarazada? En realidad, son buenas noticias, ya que tu bebé recibe más oxígeno y nutrientes a través de la placenta. Por eso, tener palpitaciones puede ser normal durante el embarazo. Si también sientes que te falta el aire o que tu corazón se acelera y tus pulsaciones no bajan, visita a tu médico lo antes posible.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor de pelvis', 'Las hormonas del embarazo aflojan las articulaciones, ayudándolas a ser más flexibles. Sin embargo, esta flexibilidad puede causarte dolor. Por ello, intenta no levantar objetos pesados y evita estar de pie durante mucho tiempo. Sigue leyendo sobre el dolor de pelvis y de cadera.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor o calambres abdominales', 'Es posible que sientas calambres uterinos leves o dolor abdominal en la semana 22 de embarazo o en otro momento de este trimestre. Esto puede ser normal. Puedes estar sintiendo las contracciones de Braxton Hicks, que ayudan a tu cuerpo a prepararse para el parto, o simplemente notar cómo se estiran los músculos y los ligamentos abdominales a medida que crece tu vientre. No obstante, si los calambres o el dolor que sientes son intensos, o si no estás segura de si lo que sientes es normal o no, visita a tu médico.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolores y molestias', 'A medida que tu vientre crece y aumentas de peso, es normal que sientas algunos dolores y molestias, tanto al moverte como al descansar. Alrededor de la semana 23 de embarazo, es posible que te duelan los músculos o que tengas un ligero dolor de cabeza de vez en cuando. Para aliviar los dolores y las molestias musculares, date un baño caliente, masajéate la zona afectada o aplica una almohadilla térmica al punto dolorido. Si te duele la cabeza, túmbate y colócate una compresa fría en la cabeza. Si sientes un dolor intenso o si el dolor de cabeza no desaparece, visita a tu médico. También debes consultar a tu médico antes de tomar cualquier analgésico que se venda sin receta, aunque lo tomaras antes de estar embarazada.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('cambios en la piel', 'Es posible que empieces a notar manchas más oscuras en la piel del cuerpo y la cara debido a los cambios hormonales. Esto ocurre porque se estimulan las células que producen un pigmento llamado melanina. Las manchas marrones de la cara se denominan cloasma y la línea oscura del abdomen recibe el nombre de linea nigra. Estas zonas pigmentadas suelen desaparecer con el tiempo tras el nacimiento del bebé. Los expertos afirman que evitar una exposición excesiva al sol y utilizar protectores solares puede ayudar a reducir el cloasma. A medida que tu cuerpo crece, también puedes ver líneas donde la piel se estira. Las estrías del embarazo suelen aparecer en zonas como el vientre, las nalgas y los pechos. Las estrías no se pueden evitar, pero pueden desaparecer con el tiempo tras el nacimiento del bebé. Es posible que también sientas picor cuando se te estira la piel. Aplicar una crema hidratante puede ayudar a reducir la sensación de picor.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('mareos y pérdida de equilibrio', 'El crecimiento de tu barriga afecta a la distribución del peso, lo que hace que sea más fácil que pierdas el equilibrio. Además, los cambios en la circulación pueden hacer que te sientas mareada o aturdida. Tomar algunas medidas, como moverte despacio (sobre todo cuando te levantas o cambias de postura), beber mucha agua y mantenerte hidratada, puede ayudar. Si te sientes mareada, túmbate de lado a ser posible. Si estás preocupada, pídele consejo a tu médico.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('ciática', 'A medida que el útero crece, puede ejercer presión sobre el nervio ciático, lo que provoca dolor de cadera y lumbar en la semana 25 de embarazo o más adelante. Para aliviar el dolor, puedes aplicar una bolsa de hielo o de frío en esa zona. También puedes preguntar a tu médico qué ejercicios de estiramiento pueden ayudarte. Antes de tomar cualquier analgésico de venta sin receta, asegúrate de preguntarle a tu médico si es seguro que te lo tomes. En cualquier caso, estos dolores suelen desaparecer después del parto. Hasta entonces, si sientes entumecimiento en los pies o las piernas, o si nada de lo que hagas te ayuda a aliviar el dolor, comunícaselo a tu médico de inmediato.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('contracciones de Braxton Hicks', 'Algunas futuras mamás experimentan las llamadas contracciones de Braxton Hicks, aunque es más probable que se produzcan en el tercer trimestre. Las contracciones de Braxton Hicks pueden sentirse como una opresión en el abdomen o pueden ser un poco más dolorosas. Ten en cuenta que es más probable que se produzcan a última hora del día o después de hacer ejercicio o mantener relaciones sexuales. Mantenerse hidratada es una forma de evitar las contracciones de Braxton Hicks. Si no estás segura de si tienes contracciones de Braxton Hicks o contracciones de parto reales, acude al médico inmediatamente.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('estrés y ansiedad', 'El estrés y la ansiedad pueden aparecer durante el embarazo cuando empiezas a prepararte para la llegada del bebé. Es normal que sientas algo de ansiedad por los cambios de vida que te esperan. Si tienes antecedentes de depresión o estás más preocupada o ansiosa de lo habitual, habla con tu médico sobre el estrés durante el embarazo. Mantener una rutina de ejercicio moderado también puede ayudarte a controlar el estrés, al igual que reunirte con amigos. Date un respiro de vez en cuando y recuerda que no estás sola.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('cambios en la pigmentación de la piel', 'A lo largo del embarazo, tu cuerpo aumenta la producción de melanina, un pigmento que puede oscurecerte la piel. Puedes notar que tus pezones son más oscuros y que ha aparecido una línea vertical oscura llamada linea nigra, que baja desde el ombligo. A algunas futuras mamás también les aparecen manchas marrones en las mejillas, la nariz y la frente, llamadas cloasma. Estos cambios en el tono de la piel suelen ser temporales y deberían desaparecer después del parto. Asegúrate de no exponerte al sol o, si tienes que hacerlo, protégete al máximo. La exposición a los rayos UV puede agravar estas manchas oscuras.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('sueños vívidos', 'No es raro tener sueños extraños durante el embarazo, especialmente en el tercer trimestre. Aunque pueden ser entretenidos, a veces influyen en el descanso nocturno. Algo que puede ayudarte a dormir más profundamente es tomar un tentempié rico en proteínas antes de acostarte para mantener tus niveles de azúcar en sangre. Algunas buenas opciones ricas en proteínas son un poco de mantequilla de cacahuete o el queso.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('falta de aire', ' A medida que el útero se expande, los órganos abdominales empiezan a estar un poco apretados. El estómago y el diafragma pueden ejercer presión sobre los pulmones, lo que hace más difícil respirar profundamente. No es algo de lo que debas preocuparte. Tu bebé recibe mucho aire, aunque parezca que tú no lo haces. Si te quedas sin aliento, procura tener en cuenta la postura. Si te mantienes erguida, tus pulmones tendrán un poco más de espacio para expandirse y te resultará más fácil respirar.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('necesidad frecuente de orinar', 'Es posible que te hayas encontrado con este molesto síntoma al principio del embarazo, y puede volver con fuerza en el tercer trimestre. En las primeras semanas de embarazo, las ganas de orinar se debían al aumento de sangre en el cuerpo, que hacía que los riñones trabajasen más de la cuenta. Si tienes necesidad frecuente de orinar en el tercer trimestre, probablemente se deba a que el bebé está creciendo y ejerce presión sobre tu vejiga. No reduzcas el consumo de agua y otros líquidos. Si tienes pérdidas de orina, prueba a utilizar un salvaslip.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('varices', 'Si observas unas venas azules abultadas en las piernas que duelen o pican, puede que sean varices. Suelen aparecer porque el útero ejerce presión sobre las venas principales que transportan la sangre desde la parte inferior del cuerpo hasta el corazón. Es más probable que tengas varices si no es tu primer embarazo o son comunes en tu familia. Aunque tengan un aspecto desagradable, no suelen ser un problema médico. Para aliviar las molestias intenta no estar sentada o de pie durante mucho tiempo y pon los pies en alto siempre que puedas para mejorar la circulación. El uso de medias de compresión también puede ayudar, pero debes asegurarte de que el estilo que elijas no te aprieta en el muslo ni la rodilla.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('picor', 'Debido al aumento de peso durante el embarazo y el crecimiento de la tipa, en torno a la semana 30 de embarazo puedes sentir picores a medida que la piel se estira y se seca. Aplica crema hidratante en la zona y mantente hidratada para aliviar las molestias.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor en las manos', 'Puedes que tengas el síndrome del túnel carpiano. Esto ocurre cuando los tejidos de las manos se hinchan, lo que produce una sensación de hormigueo o adormecimiento. Por lo general, estos síntomas desaparecen cuando das a luz. Además, la hinchazón disminuye. Puedes utilizar una férula para la muñeca y descansar las manos a lo largo del día. Comenta al médico que tienes este síntoma para que te indique cómo aliviar las molestias.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('molestias por los movimientos del bebé', 'A veces, recibir patadas y pinchazos de tu pequeño puede ser realmente incómodo. Por otro lado, sentir que se mueve es tranquilizador. En este momento el médico puede recomendarte que cuentes los movimientos a diario.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('agotamiento', 'Es normal que te sientas cansada en esta etapa; al fin y al cabo, tu cuerpo está trabajando duro para crear una nueva vida. Además, el cansancio puede verse agravado por el hecho de que te cuesta dormir bien. Intenta echarte una siesta cuando puedas a lo largo del día. Comer bien y hacer ejercicio puede darte una pequeña dosis de energía. Consulta al médico si te preocupa estar tan cansada.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('sensación de dientes más sueltos', 'Los cambios hormonales pueden hacer que los ligamentos se relajen, incluidos que mantienen los dientes en su sitio. Por lo tanto, puedes notarlos más sueltos. No te preocupes, ya que no perderás ninguno. Además, la sensación suele desaparecer después del parto.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('llagas en la boca', 'Es posible que este problema ocurra porque el sistema inmunitario trabaja en exceso para eliminar los gérmenes de la boca. La buena noticia es que suelen desaparecer después del embarazo.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('micción frecuente', 'El crecimiento del bebé puede ejercer una presión no deseada sobre tu vejiga. Esto implica que probablemente orinarás más frecuentemente de día y de noche. Además, puedes tener pérdidas cuando te rías, tosas o estornudes. No hay mucho que puedas hacer para aliviar este síntoma, pero puedes ponerte un salvaslip por si se producen accidentes leves. No dejes de beber agua, ya que debes mantenerte hidratada. Te recomendamos ir al baño antes de, por ejemplo, salir de casa o asistir a una reunión de trabajo.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('hinchazón en las piernas', 'El útero puede ejercer presión sobre las venas que transportan la sangre desde la parte inferior del cuerpo hasta el corazón, lo que provoca hinchazón en las piernas. Si se te hinchan las piernas o los pies, evita estar de pie durante mucho tiempo y pon los pies en alto cuando sea posible para mejorar la circulación. Usa calzado cómodo y medias de compresión.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('síndrome del túnel carpiano', 'La hinchazón también puede ejercer presión sobre los nervios de las muñecas y las manos, por lo que algunas madres desarrollan el síndrome del túnel carpiano. Afecta a los huesos y ligamentos de la muñeca y puede causar molestias (por ejemplo, entumecimiento o sensación de hormigueo). Este síntoma suele desaparecer tras el parto. Usa muñequeras o férulas si te sientes más cómoda y consulta al médico para obtener más consejos.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('aumento de los pechos', 'Tus pechos aumentarán de tamaño a medida que te acerques al final del tercer trimestre. Dado que la piel se estira, puedes notar picor en la zona. En este punto ya sabes de sobra lo útil que es la crema hidratante, pero también te recomendamos usar un sujetador adecuado. Muchas tiendas y mercerías cuentan con profesionales que te ayudarán a encontrar un sujetador que te quede bien y te ofrezca un apoyo adecuado. Es posible que tengas que ajustar la longitud de la correa o usar un extensor de broche durante los primeros meses de maternidad. Sigue leyendo sobre los cambios en los pechos durante el embarazo.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor de pelvis', ' En la semana 34 el bebé desciende por la pelvis, lo que puede causar dolor en la zona, molestias en las lumbares y presión en la vejiga. Lo bueno es que sentirás más libre la zona del diafragma y los pulmones, por lo que respirarás mejor. Para aliviar las molestias, evita estar de pie cuando te sientas incómoda. También puedes darte un baño con agua tibia. Si estas ideas no funcionan, consulta al médico para que te aconseje.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('entumecimiento de manos y pies', 'A veces la hinchazón del cuerpo presiona los nervios y puede causar entumecimiento u hormigueo en las manos y los pies. Consulta al médico si te molesta a menudo o te causa dolor. Las férulas de muñeca pueden reducir el hormigueo en las manos. También puedes descansar en posiciones que no ejerzan presión en las manos y los pies, como apoyar los brazos y las piernas en almohadas. La buena noticia es que estos síntomas suelen desaparecer después dar a luz.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('dolor en la zona lumbar', 'A las 36 semanas de embarazo no es raro sentir algo de dolor en la zona lumbar. La hormona relaxina empieza a aflojar las articulaciones y los ligamentos de la pelvis como preparación al parto, lo que causa dolor de espalda al sentarte, ponerte de pie o subir escaleras. Consulta al médico si para que te recomiende estiramientos suaves que te ayuden a aliviar las molestias.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('presión o dolor en la pelvis', 'Puede que tu pequeño descienda hacia la pelvis unas semanas antes de dar a luz, por lo que notarás un poco más de presión en la parte baja del abdomen. Este dolor de pelvis puede hacer que te cueste andar. Si la presión te incomoda, prueba a darte un baño con agua tibia. Pregunta al médico qué otras cosas puedes hacer para aliviar las molestias.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('naúseas', 'Algunas madres tienen náuseas en la semana 37 de embarazo, lo que indica que el parto está a punto de comenzar. Come cantidades más pequeñas con mayor frecuencia para aliviar las molestias. Los alimentos suaves como el arroz, las tostadas o el plátano también pueden ayudarte a superar estos episodios.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('ronquidos', 'Es posible que esto no te preocupe tanto como a tu pareja. La mayoría de las madres experimentan cambios respiratorios durante el embarazo debido a las hormonas. En la recta final es normal que ronques un poco, ya que las membranas mucosas de las fosas nasales tienden a secarse. Mantente hidratada y pon un humidificador en el dormitorio si tus ronquidos resultan molestos.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('falta de estabilidad', 'En este punto el aumento de peso provocará que tu centro de gravedad cambie, por lo que te será más fácil perder el equilibrio. Los kilos de más que suponen el bebé, la placenta, el líquido amniótico y tú misma pueden impedir que te muevas con normalidad. La distribución del peso volverá a cambiar cuando tu hijo descienda hacia la pelvis, así que debes tener cuidado. Para mantener la estabilidad te recomendamos levantarte con los pies apuntado en la misma dirección. No inclines la pelvis hacia adelante ni hacia atrás, y evita levantar o cargar objetos pesados.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('contracciones', 'En la semana 37 de embarazo puedes notar contracciones, que son similares a los calambres menstruales. Si son irregulares y desaparecen al cambiar de posición, lo más probable es que sean contracciones de Braxton Hicks. Sin embargo, si las contracciones son regulares, aumentan de intensidad y no desaparecen al cambiar de posición, consulta al médico para que te aconseje. Mide el tiempo entre cada contracción y coméntaselo al médico, ya que esta información es muy útil. Sigue leyendo para saber cómo medir las contracciones.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('problemas para dormir', 'En la recta final del embarazo puede costarte dormir por las noches. El tamaño del abdomen impide encontrar una posición cómoda, y los nervios y la ansiedad tampoco ayudan mucho. Haz que tu dormitorio sea un lugar en el que te guste estar. Coloca almohadas extra y usa un perfume para sábanas agradable.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('expulsión del tapón mucoso', 'En la semana 39 de embarazo la expulsión del tapón mucoso puede indicar que falta poco para el parto, tal vez horas o días. El tapón mucoso es un flujo claro, rosado o con algo de sangre que sella el cuello uterino durante el embarazo y mantiene las bacterias a raya. Algunas madres no se enteran de que lo han expulsado, pero otras sí. Si la secreción es diferente a la que acabamos de describir, consulta al médico inmediatamente.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('rotura de aguas', 'Ya lo avisan en las películas: romper aguas es sinónimo de dar a luz. Básicamente, sucede cuando el saco amniótico que rodea al bebé se rompe y el líquido amniótico gotea, suele indicar que el parto ha comenzado. Llama al médico cuando rompas aguas para que te diga qué hacer. Si el líquido amniótico huele mal o tienes fiebre, coméntaselo, ya que puede ser un síntoma de corioamnionitis.');

INSERT INTO symptoms (symptom_name, symptom_description)
        VALUES ('preeclampsia', 'A algunas madres se les diagnostica este trastorno de la presión arterial en las últimas semanas de embarazo. Algunos síntomas posibles en la semana 39 de embarazo incluyen hinchazón en la cara o las manos, dolor de cabeza, náuseas o vómitos, aumento repentino de peso, dificultad para respirar y cambios en la visión. Aunque el médico habrá controlado tu presión arterial periódicamente durante el embarazo, debes avisarle si tienes alguno de estos síntomas.');

/*---------------------------------------WEEK 1-3-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 1, 1);
/*---------------------------------------WEEK 4-----------------------------------*/    
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 2, 2);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 2, 3);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 2, 4);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 2, 5);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 2, 6);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 2, 7);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 2, 8);
/*---------------------------------------WEEK 5-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 3, 6);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 3, 3);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 3, 5);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 3, 8);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 3, 9);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 3, 4);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 3, 10);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 3, 11);
/*---------------------------------------WEEK 6-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 4, 3);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 4, 12);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 4, 8);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 4, 6);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 4, 4);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 4, 9);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 4, 11);
/*---------------------------------------WEEK 7-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 5, 13);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 5, 14);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 5, 15);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 5, 6);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 5, 3);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 5, 12);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 5, 8);
/*---------------------------------------WEEK 8-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 6, 6);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 6, 14);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 6, 15);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 6, 9);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 6, 12);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 6, 16);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 6, 3);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 6, 8);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 6, 17);
/*---------------------------------------WEEK 9-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 7, 3);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 7, 18);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 7, 19);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 7, 14);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 7, 8);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 7, 4);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 7, 6);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 7, 9);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 7, 10);
/*---------------------------------------WEEK 10-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 8, 6);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 8, 20);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 8, 21);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 8, 8);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 8, 22);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 8, 4);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 8, 10);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 8, 23);
/*---------------------------------------WEEK 11-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 9, 23);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 9, 24);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 9, 25);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 9, 26);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 9, 8);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 9, 6);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 9, 4);
/*---------------------------------------WEEK 12-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 10, 27);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 10, 28);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 10, 29);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 10, 3);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 10, 2);
/*---------------------------------------WEEK 13-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 11, 23);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 11, 30);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 11, 31);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 11, 32);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 11, 33);
/*---------------------------------------WEEK 14-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 12, 33);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 12, 34);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 12, 35);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 12, 26);
/*---------------------------------------WEEK 15-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 13, 36);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 13, 27);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 13, 34);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 13, 37);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 13, 38);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 13, 39);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 13, 40);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 13, 41);
/*---------------------------------------WEEK 16-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 14, 42);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 14, 43);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 14, 37);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 14, 28);
/*---------------------------------------WEEK 17-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 15, 44);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 15, 45);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 15, 31);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 15, 37);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 15, 26);
/*---------------------------------------WEEK 18-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 16, 28);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 16, 46);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 16, 26);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 16, 43);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 16, 47);
/*---------------------------------------WEEK 19-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 17, 42);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 17, 37);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 17, 20);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 17, 43);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 17, 28);
/*---------------------------------------WEEK 20-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 18, 32);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 18, 34);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 18, 37);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 18, 39);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 18, 36);
/*---------------------------------------WEEK 21-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 19, 37);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 19, 31);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 19, 49);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 19, 50);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 19, 26);
/*---------------------------------------WEEK 22-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 20, 31);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 20, 49);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 20, 51);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 20, 52);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 20, 53);
/*---------------------------------------WEEK 23-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 21, 54);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 21, 26);
/*---------------------------------------WEEK 24-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 22, 55);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 22, 20);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 22, 17);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 22, 28);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 22, 26);
/*---------------------------------------WEEK 25-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 23, 57);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 23, 32);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 23, 31);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 23, 26);
/*---------------------------------------WEEK 26-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 24, 52);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 24, 58);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 24, 59);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 24, 41);
/*---------------------------------------WEEK 27-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 25, 52);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 25, 32);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 25, 23);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 25, 60);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 25, 61);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 25, 26);
/*---------------------------------------WEEK 28-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 26, 48);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 26, 62);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 26, 44);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 26, 58);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 26, 63);
/*---------------------------------------WEEK 29-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 27, 64);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 27, 8);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 27, 26);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 27, 62);
/*---------------------------------------WEEK 30-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 28, 58);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 28, 65);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 28, 15);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 28, 62);
/*---------------------------------------WEEK 31-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 29, 66);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 29, 67);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 29, 68);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 29, 65);
/*---------------------------------------WEEK 32-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 30, 26);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 30, 15);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 30, 39);
/*---------------------------------------WEEK 33-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 31, 9);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 31, 58);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 31, 72);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 31, 73);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 31, 65);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 31, 53);
/*---------------------------------------WEEK 34-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 32, 74);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 32, 75);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 32, 36);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 32, 32);
/*---------------------------------------WEEK 35-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 33, 71);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 33, 17);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 33, 36);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 33, 76);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 33, 31);
/*---------------------------------------WEEK 36-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 34, 71);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 34, 58);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 34, 17);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 34, 76);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 34, 77);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 34, 36);
/*---------------------------------------WEEK 37-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 35, 78);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 35, 62);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 35, 79);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 35, 80);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 35, 81);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 35, 82);
/*---------------------------------------WEEK 38-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 36, 71);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 36, 78);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 36, 36);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 36, 79);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 36, 82);
/*---------------------------------------WEEK 39-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 37, 83);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 37, 84);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 37, 85);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 37, 86);
/*---------------------------------------WEEK 40-----------------------------------*/
INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 38, 80);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 38, 82);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 38, 84);

INSERT INTO weeks_symptoms (week_id, symptom_id)
        VALUES ( 38, 85);   



/*---------------------------------------WEEK 3 ADVICE-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 1, 'Comer sano.'); 
/*---------------------------------------WEEK 4-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 2, 'Si aún no lo has hecho, ahora es un buen momento para empezar una dieta saludable. Asegúrate de ingerir alimentos con hierro, como espinacas y cereales, para evitar la anemia. También es bueno tomar leche, queso o yogur, ya que contienen mucho calcio y ayudan a que los huesos del bebé crezcan fuertes.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 2, 'Deja los hábitos poco saludables, como fumar o beber. Reemplaza el alcohol por agua u otras bebidas adecuadas para evitar el parto prematuro y los defectos congénitos.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 2, 'Evita el tabaquismo pasivo. Varios estudios recientes han demostrado que la exposición al humo puede causar problemas, como aborto espontáneo, embarazo ectópico o peso reducido del bebé al nacer.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 2, 'Relájate y mantén los niveles de estrés al mínimo.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 2, 'Sigue haciendo ejercicio si el médico da el visto bueno. La mayoría de las mujeres pueden mantener su rutina de deporte a menos que haya complicaciones. Si no has hecho ejercicio antes, pregunta al médico si puedes seguir una rutina sencilla con actividades como nadar, caminar o estirar. El parto es complicado, por lo que será mejor si estás en forma.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 2, 'Toma vitaminas prenatales a diario para sentirte bien y ayudar a que tu pequeño crezca. Busca aquellas que contengan al menos 400 microgramos de ácido fólico, que es fundamental para reducir la probabilidad de defectos congénitos.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 2, 'Busca un ginecólogo para que te atienda a lo largo del embarazo si aún no sabes quién será.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 2, 'Crea un libro de recuerdos para documentar el embarazo y que tu hijo lo vea más adelante. Puedes hacerlo tú misma o comprarlo en una tienda local o por Internet. Añade fotos de la tripa semana a semana para ver el progreso y anota fechas especiales, como el día en que te enteraste de que estabas embarazada o notaste los primeros movimientos del bebé. Tal vez quieras escribir una carta a tu pequeño para que la lea cuando pasen unos años o escribir predicciones sobre el color de ojos y pelo. Quién sabe, puede que al final tengas razón.'); 
/*---------------------------------------WEEK 5-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 3, 'Piensa bien en la dieta que vas a seguir, ya que debe incluir todo tipo de alimentos saludables. Evita el pescado que pueda contener altos niveles de mercurio (por ejemplo, el tiburón, el pez espada o el atún) y cualquier alimento que no esté cocinado o pasteurizado. Tampoco comas sushi hecho con pescado crudo, ostras ni quesos blandos, como el brie o el feta. Estos alimentos pueden causar enfermedades que os afecten tanto a ti como a tu pequeño.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 3, 'Piensa si quieres compartir la noticia de que estás de cinco semanas con familiares y amigos. Algunas madres prefieren esperar al final del primer trimestre, ya que el riesgo de aborto espontáneo se reduce significativamente. No obstante, otras lo cuentan nada más hacerse el test de embarazo.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 3, '¿Tienes gato? Pide a otra persona que limpie el cajón de arena para no contraer toxoplasmosis, que es una infección perjudicial para los bebés que aún no han nacido.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 3, 'Comienza a escribir un diario. Es normal sentir muchas emociones mientras te adaptas a la idea de que estás embarazada. Independientemente de que sea una sorpresa o lleves mucho tiempo esperándolo, tus sentimientos pueden ser diferentes de lo que esperabas. De hecho, pueden cambiar de un día para otro. Escribir un diario es una forma de sacar fuera los pensamientos y sentimientos más íntimos. Te ayudará a navegar por los altibajos emocionales en las primeras semanas del embarazo.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 3, 'Aunque todavía no tengas tripa, puede que quieras hacer una sesión de fotos cada mes. Puedes guardarlas para ti o compartirlas en redes sociales cuando estés lista para anunciar el embarazo. Dentro de unos años podrás recordar cómo creció la tripa. Además, a tu pequeño le encantará saber qué aspecto tenía su primer hogar.'); 
/*---------------------------------------WEEK 6-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 4, 'Una de las primeras cosas que notarás en estas semanas es que los pechos aumentan de tamaño. El aumento de hormonas del embarazo también puede provocar cambios en la piel, como una mayor producción de sebo. Los pezones se oscurecerán un tono o dos debido a la hiperpigmentación.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 4, 'Asegúrate de tener ropa elástica o suelta para usarla durante las próximas semanas. La tripa no tardará mucho en crecer, por lo que querrás estar cómoda aunque todavía no vayas a usar ropa premamá. Probablemente querrás evitar los pantalones ajustados a partir de ahora. Además, te recomendamos usar ropa interior de algodón. No olvides cambiar de talla de sujetador según sea necesario.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 4, 'Revisa tu póliza de seguro médico y asegúrate de que cubre todo lo que necesitas. Si no tienes seguro para ti o el bebé, busca en Internet las opciones disponibles en tu zona.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 4, 'Si puedes, organízate para poder descansar. Aunque tengas muchas cosas que hacer, te recomendamos programar tiempo de descanso durante el primer trimestre, sobre todo si tienes fatiga. Échate una siesta, duerme hasta tarde o acuéstate antes siempre que sea posible.'); 
/*---------------------------------------WEEK 7-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 5, 'Puede que quieras comprar algunas prendas para cuando la tripa crezca. La ropa elástica es perfecta para estar cómoda, pero también hay que tener en cuenta la talla y el material. Por ejemplo, debes usar una talla correcta de sujetador y usar ropa interior de algodón u otras fibras naturales para estar fresca y cómoda. '); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 5, 'Asegúrate de que tanto tú como el bebé estéis recibiendo los nutrientes necesarios. Evita los alimentos picantes o fritos, ya que pueden causar acidez. Si eres vegetariana o vegana, pregunta al médico si debes tomar algún suplemento (por ejemplo, la vitamina B12, que se encuentra solo en productos de origen animal).'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 5, 'Cuida tu piel. Puede que esta semana tengas acné, por lo que te recomendamos seguir una rutina adecuada para evitar la aparición de granitos y puntos negros. Lávate la cara dos veces al día con un limpiador suave, apártate el pelo de la cara y usa productos de maquillaje y cuidado para la piel que no contengan aceites.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 5, 'Si los síntomas del embarazo te hacen sentir triste, recuerda que queda poco más de un mes para el segundo trimestre y muchos de ellos comenzarán a desaparecer. Además, muchas madres experimentan un aumento de los niveles de energía durante este nuevo periodo. No obstante, si los cambios de humor son particularmente intensos o tienes una enfermedad mental que requiere ayuda, consulta al médico. Te indicará lo que debes hacer para gestionar la situación durante el resto del embarazo.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 5, 'Hazte una sesión de fotos cada mes para ver cómo crece la tripa. Colócate siempre en el mismo sitio y usa la misma ropa. El recuerdo te hará sonreír en los próximos años. Además, también podrás compartir las imágenes en redes sociales o enviarlas por correo electrónico a tus seres queridos.'); 
/*---------------------------------------WEEK 8-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 6, 'Haz ejercicio. Si eras muy activa antes del embarazo, normalmente podrás seguir realizando tus actividades. No obstante, consulta al médico para estar segura.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 6, 'Recibir una buena atención es muy importante. Es el momento de ir al ginecólogo. Si aún no has escogido uno, es el momento perfecto. Tus opciones dependerán del lugar donde vivas y la cobertura de tu seguro. Sea quien sea, es importante que te sientas cómoda con su filosofía y su forma de trabajar.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 6, 'Habla con otras madres que vayan a dar a luz en las mismas fechas que tú o vivan en la zona. Puede que haya algún grupo en redes sociales o grupos de apoyo comunitarios a los que puedas acudir. Los padres con bebés o niños pequeños de tu zona pueden ofrecerte mucha información y apoyo.'); 
/*---------------------------------------WEEK 9-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 7, 'Asegúrate de cambiar de talla de sujetador cuando sea necesario para estar cómoda. Puede que necesites sujetadores de maternidad en esta semana o en las próximas.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 7, 'Durante el embarazo, los expertos recomiendan reducir el consumo de cafeína. Esta se encuentra en varios alimentos y bebidas, como el café, el té, los refrescos o el chocolate. Intenta limitar su consumo diario a 200 mg como máximo (el equivalente a una taza de 350 ml).'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 7, 'Durante los próximos meses es posible que tengas gastos adicionales relacionados con el embarazo y la compra de productos para bebés. Puede que muchas de esas cosas te las regalen en la fiesta de Baby Shower o te las presten otros padres, pero te recomendamos crear un presupuesto para cualquier imprevisto que surja. Habla con otros padres para saber qué debes tener en cuenta, qué cosas se pueden omitir y cómo ahorrar en esas compras imprescindibles. Te darán muchos consejos y trucos según su experiencia. También puedes preguntar al médico qué recursos gratuitos o con descuento hay disponibles en tu zona.'); 
/*---------------------------------------WEEK 10-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 8, 'A medida que avance el embarazo, el peso del útero puede ralentizar el flujo sanguíneo en la parte inferior del cuerpo. En ese caso, las venas de las piernas pueden hincharse, doler o adoptar un color azul. No es posible evitarlo, pero sí tomar medidas para aliviar el malestar y evitar que la situación empeore. No te sientes con las piernas cruzadas ni permanezcas de pie durante mucho tiempo. Usa medias de compresión y pon las piernas en alto siempre que puedas para mejorar el flujo sanguíneo. También te recomendamos mantenerte activa y hacer ejercicio ligero a diario si el médico da el visto bueno.'); 
/*---------------------------------------WEEK 11-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 9, 'Mientras estés embarazada, debes tomar entre 80 y 85 mg de vitamina C todos los días para favorecer el desarrollo de los huesos y los dientes del bebé. Añade naranjas y otros cítricos, fresas, tomates y brócoli a tu dieta para aumentar la ingesta de vitamina C. Si quieres saber si lo estás haciendo bien, consulta al médico.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 9, 'Comienza a pensar dónde darás a luz. No es necesario que tomes una decisión ya, pero te recomendamos investigar qué opciones hay en tu entorno. Pide consejo al médico, la matrona u otras madres de la zona.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 9, 'Recordatorio para los padres: infórmate sobre la posibilidad de solicitar una baja de paternidad, un subsidio o cualquier otra prestación, ya sea conforme a las medidas de tu trabajo o a un plan del Gobierno. Busca información en Internet sobre la baja de paternidad.'); 
/*---------------------------------------WEEK 12-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 10, 'Sigue una dieta equilibrada que incluya proteínas, como las de la carne roja, el pollo, el pescado o los sustitutos vegetales. Debes incluir una amplia variedad de verduras y frutas todos los días para obtener las vitaminas y los minerales que contienen, así como alimentos ricos en calcio (por ejemplo, lácteos bajos en grasa, judías, nueces o tofu).'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 10, 'Comienza a hacer los ejercicios de Kegel. Estos fortalecen los músculos del suelo pélvico, que son los que sostienen el útero y la vejiga. Son muy beneficiosos para prevenir las pérdidas de orina durante el embarazo y en los meses posteriores. Los ejercicios de Kegel son muy fáciles de hacer. Contrae los músculos que apretarías si quisieras interrumpir el flujo de orina o dejar de expulsar gases. Aguanta unos segundos y suelta. Haz tres series de veinte repeticiones cada día. Prueba a aumentar la intensidad a medida que los músculos se fortalecen.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 10, 'Estudia lo que está por venir. A medida que avances en el segundo trimestre, querrás saberlo todo sobre esta etapa.'); 
/*---------------------------------------WEEK 13-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 11, 'Si trabajas, piensa cuándo y cómo contarás a tu jefe y a tus compañeros de trabajo que estás embarazada. De este modo, podrán organizarse para cubrir tu ausencia durante la baja de maternidad.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 11, 'Si es así, sigue con ello. De lo contrario, pregunta al médico cómo puedes comenzar una rutina básica de ejercicios. Si te da el visto bueno, puedes comenzar a andar, nadar o incluso practicar yoga. Tus músculos lo agradecerán, sobre todo durante los últimos meses del embarazo y los primeros meses de vida del bebé. El ejercicio te ayudará a controlar el exceso de estrés que experimentará tu organismo.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 11, 'Si haces abdominales boca arriba, te recomendamos buscar alternativas durante el embarazo, ya que el peso del útero puede hacer que llegue menos sangre al corazón en esa posición. Pide al médico que te recomiende alternativas.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 11, 'Ahora que hablamos de ejercicio, ¿conoces los músculos del suelo pélvico? Si los fortaleces, podrás controlar mejor la vejiga y fijar los órganos de la zona en su posición. Estos son la vejiga, el útero, el intestino delgado y el recto. Una buena forma de entrenarlos son los ejercicios de Kegel. Son ejercicios para el suelo pélvico en los que tendrás que apretar y relajar los músculos de las zonas pélvica y genital. Puedes hacerlos en tiempos diferentes (por ejemplo, apretar tres segundos y relajar otros tres o apretar y relajar rápidamente).'); 
/*---------------------------------------WEEK 14-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 12, '¿Has ido ya al dentista? Si no es así, pide cita para una revisión y una limpieza. Tus dientes y tus encías requieren una atención especial durante el embarazo para evitar gingivitis y enfermedades periodontales.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 12, 'Ten cuidado con las bacterias. La respuesta inmunitaria del organismo cambia durante el embarazo, por lo que un resfriado o una gripe podrían afectarte más que de costumbre. Vacúnate contra la gripe, lávate las manos con frecuencia y evita compartir espacio con personas que estén enfermas.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 12, '¿Has pensado en asistir a clases prenatales? Es un momento perfecto para buscar las opciones disponibles en tu zona.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 12, '¿Has pensado en hacer una «luna de miel del embarazo»? No eres la única. Muchos padres aprovechan la oportunidad para escaparse antes de que la tripa comience a molestar y la fecha de parto se acerque. Consulta al médico antes de reservar un viaje. Además, si vas a ir en avión, te recomendamos leer las políticas de las aerolíneas en relación con el embarazo.'); 
/*---------------------------------------WEEK 15-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 13, 'La mejor manera de mantener un buen nivel de energía y tonificar los músculos es hacer ejercicio suave (por ejemplo, caminar, nadar o practicar yoga). Consulta al médico para que te dé el visto bueno antes de iniciar una nueva rutina de deporte. Caminar es una opción muy buena porque afecta poco al organismo. Además, puedes pedir a un amigo o a un familiar que te acompañen para entretenerte. Puedes usar una aplicación o algún dispositivo de seguimiento para controlar tu nivel de actividad diario.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 13, 'Para la mayoría de las madres, tener relaciones sexuales en estos meses es totalmente seguro. Comenta con tu pareja lo que creas oportuno y consulta al médico si tienes dudas sobre el sexo en el embarazo. Ten en cuenta que tu deseo sexual o el de tu pareja pueden cambiar, ya que en ellos influyen cosas como las hormonas del embarazo, la tripa, la sensación que tengas respecto a los cambios y los síntomas que experimentes.'); 
/*---------------------------------------WEEK 16-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 14, 'En esta etapa el embarazo puede resultar muy divertido. Si los molestos síntomas de las primeras semanas han desaparecido, es probable que tengas más energía. Disfruta de este periodo y mantente activa.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 14, 'Tal vez quieras solicitar la ayuda de un profesional en tu tienda o tu mercería locales para comprar ropa interior cómoda y sujetadores que te queden bien. Te recomendamos usar tirantes anchos, cobertura total y extensores. Si haces ejercicio, compra sujetadores deportivos de tallas mayores a medida que avance el embarazo.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 14, 'Si no duermes bien, puedes utilizar una almohada entre las rodillas o debajo del abdomen para apoyarte mientras estás tumbada de costado. Las almohadas especiales para embarazadas son otra buena opción.'); 
/*---------------------------------------WEEK 17-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 15, 'Seguramente querrás saber si vas a tener un niño o una niña. Aunque todavía puede ser demasiado pronto, puedes solicitar una ecografía entre las semanas 18 y 20. Ten en cuenta que, si el bebé está mal colocado, el médico no podrá ofrecerte información precisa sobre su sexo.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 15, '¿Te has informado ya sobre las clases prenatales? Ya casi has llegado a la mitad de este recorrido, así que puedes comenzar a investigar las opciones disponibles en tu zona. Cuanto antes lo hagas, más tiempo tendrás para estudiar las clases, los horarios y las fechas disponibles. Si no estás segura de por dónde empezar, pide información al médico o a otros padres.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 15, 'Piensa si quieres hacerte alguna prueba genética. Escribe las preguntas que tengas en relación con el tema y consulta al médico sobre los riesgos y las ventajas de cada una de estas pruebas.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 15, 'Si tienes algo de tiempo libre esta semana, busca un pediatra para tu pequeño. Puedes pedir recomendaciones a otros padres o consultar la lista que ofrece tu seguro. Tu médico también podrá ayudarte. Cuando ya tengas algunas opciones, es posible que quieras concertar varias citas antes de dar a luz.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 15, 'El embarazo puede generar tensión en las relaciones de pareja, lo que es comprensible dadas las preocupaciones que puede suponer un cambio tan grande. Para evitar los conflictos, habla con tu pareja sobre lo que sientes y haz que se implique tanto como sea posible en las cosas relacionadas con tu embarazo, como las revisiones o las clases prenatales. Si crees que necesitas apoyo externo, el médico te ayudará a encontrar grupos de apoyo y asesoramiento en tu zona.');
/*---------------------------------------WEEK 18-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 16, 'Sigue una dieta rica en ácidos grasos omega-3. Es importante que obtengas los nutrientes que el bebé y tú necesitáis. Los ácidos grasos omega-3 son una parte fundamental de una dieta saludable, ya que contribuyen al desarrollo del sistema nervioso de tu pequeño. Además, según varios estudios, también pueden estimular tu sistema inmunológico y reducir los síntomas de la depresión. Toma alimentos ricos en este nutriente, como salmón u otros pescados grasos, linaza, brócoli y nueces.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 16, 'Aumenta la ingesta calórica de forma razonable. Necesitarás calorías adicionales para que el bebé crezca sano, pero no es necesario que comas por dos. Cuando llegues al segundo trimestre, bastará con 300 calorías más al día (por ejemplo, medio bocadillo o un vaso de leche desnatada) si ingieres una media de 2000 calorías al día.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 16, 'Es posible que todo el mundo, ya sea tu suegra o personas que no conoces, te den consejos sobre el embarazo. Aunque la situación puede llegar a ser molesta, intenta tomártelo con calma. No tienes que dar explicaciones a nadie. Un simple «Gracias, lo tendré en cuenta» debería ser suficiente. Recuerda que los demás tienen buena intención y se alegran por ti. Además, algunos padres pueden darte consejos muy útiles.'); 
INSERT INTO advice (week_id, advice_description)
        VALUES ( 16, 'En algunos casos, la ecografía de mitad del embarazo muestra un problema en la placenta. El médico buscará patologías como la placenta adherida o la placenta previa y te dirá qué puedes hacer para reducir los riesgos asociados a cualquiera de estas enfermedades.'); 
/*---------------------------------------WEEK 19-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 17, 'Cualquier tipo de ejercicio es bueno durante el embarazo, aunque es importante no pasarse. Caminar, nadar y practicar yoga o pilates son buenas opciones para mantenerte activa durante estos meses. En la semana 19 de embarazo te recomendamos fortalecer los músculos de la espalda y moverte un poco para reducir los niveles de estrés.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 17, 'Dado que la tripa es cada vez más grande, tal vez tengas dificultades para descansar. Dormir boca arriba a partir del segundo trimestre hace que la columna vertebral y los músculos de la espalda tengan que soportar todo el peso. Además, puede comprimir vasos sanguíneos de gran calibre, lo que causa mareos. Intenta dormir de lado con ambas piernas flexionadas y colócate una almohada entre las rodillas o debajo del abdomen. Si te despiertas de madrugada boca arriba, gírate y sigue durmiendo de lado.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 17, 'Si vas a celebrar una fiesta para el bebé en el tercer trimestre, es hora de crear la lista de regalos. La persona que la organiza tendrá que incluir estos detalles en las invitaciones, y estas deberán enviarse con bastante antelación para que los invitados puedan hacer hueco en su agenda y comprar un regalo.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 17, 'Aprovecha estos momentos para pensar qué productos vas a necesitar y comparar precios, ya sea para incluirlos en la lista de regalos o para comprarlos tú misma. Pide consejo a otros padres. También puedes consultar opiniones sobre algunos de los productos para tomar decisiones adecuadas. Ten en cuenta que no es necesario comprar todo lo que se considera útil durante los primeros días de vida de tu pequeño. Es un buen momento para pedir consejos a otros padres sobre cosas de las que se puede prescindir.');
/*---------------------------------------WEEK 20-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 18, 'Tu médico puede recomendarte una ecografía en las semanas 18 o 20 de embarazo. Esta ecografía ayuda a tu médico a confirmar que todo va bien, incluso el tamaño y la posición de tu bebé, y a comprobar que los huesos y los órganos visibles se están desarrollando correctamente. Además, esta ecografía permite al médico obtener una estimación de la edad gestacional y del peso de tu bebé, así como detectar sus movimientos y su ritmo cardíaco, ver la posición de la placenta y comprobar la cantidad de líquido amniótico. También podrás saber si tu bebé es un niño o una niña (o quizás prefieres esperar y que sea una sorpresa).');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 18, 'El segundo trimestre suele ser un buen momento para viajar, ya que los síntomas del embarazo pueden ser un poco menos intensos y es probable que tu vientre no sea todavía tan grande como para que te resulte incómodo desplazarte. Aun así, hay algunas cosas que debes tener en cuenta si estás planeando realizar una escapada. No te comprometas con un horario rígido ni planifiques demasiadas actividades, y prepárate para cambiar tu ruta en el último momento en función de cómo te sientas. Si estás pensando en volar, consúltalo con tu médico y con la aerolínea. Aunque la mayoría de las aerolíneas permiten volar a las embarazadas hasta la semana 36 aproximadamente, cada una tiene sus propias políticas. Tanto si viajas en autobús como si lo haces en tren, en coche o en avión, intenta hacer descansos y caminar con frecuencia, mantenerte hidratada, comer con regularidad para aumentar tu energía y llevar una copia de tu historial médico. Es una buena idea hacerse una revisión antes de salir para comprobar que todo esté en orden.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 18, 'Hay muchas cosas que puedes hacer para que tu pareja también forme parte de tu embarazo. Puede acompañarte a las revisiones y a las ecografías y compartir la diversión (y el trabajo) de decorar la habitación del bebé. También podéis asistir a clases de preparación al parto para que tu pareja tenga más información sobre lo que sentirás durante el parto y sobre cómo podéis prepararos para el gran día.');
/*---------------------------------------WEEK 21-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 19, 'Para ayudarte a aliviar el dolor de espalda, puedes realizar estos cambios en tu rutina diaria. Siempre que te sientes, utiliza un reposapiés para elevar los pies ligeramente. Si tienes que estar de pie durante mucho tiempo, pon un pie en un pequeño taburete para aliviar la presión de la parte baja de la espalda. Date un baño caliente para aliviarte. Si el dolor de espalda no desaparece, visita a tu médico.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 19, 'Las vitaminas del grupo B, como la B1, la B2 y la B6, son nutrientes clave, ya que aportan energía para el desarrollo de tu bebé. También ayudan a tener una buena visión y a construir la placenta, además de otros tejidos del cuerpo. Si estás tomando un suplemento prenatal, deberías estar ingiriendo suficientes vitaminas del grupo B, pero también puedes obtenerlas de otras fuentes como el hígado, la carne de cerdo, las aves de corral, los plátanos y las judías.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 19, 'La colina es otro nutriente que puedes necesitar más cuando estás embarazada. Aunque tu cuerpo puede producir colina de forma natural, cuando estás embarazada no produces suficiente para los dos. Una buena solución es seguir una dieta equilibrada, así que intenta añadir más pollo, ternera, huevos, leche y cacahuetes, que te ayudarán a complementar tus niveles de colina.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 19, 'A medida que el tamaño de tu útero aumenta, es posible que notes que tu centro de gravedad se desplaza y te sientas un poco desequilibrada. Cuídate. Utiliza calzado plano, ten cuidado con las escaleras y evita superficies resbaladizas para reducir el riesgo de caídas. Si te caes y estás preocupada, o si sangras o empiezas a tener contracciones, visita a tu médico.');
/*---------------------------------------WEEK 22-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 20, 'Prueba algunos métodos para aliviar el estrés. Es normal preocuparse durante el embarazo, pero lo mejor para tu bebé y para ti es que mantengas tus niveles de estrés bajo control. Por supuesto, es más fácil decirlo que hacerlo, pero existen estrategias que pueden ayudar, como reducir el número de horas de trabajo, delegar tareas en otras personas, hacer ejercicio con regularidad y hablar con alguien de confianza sobre tus miedos y tus ansiedades.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 20, 'Las relaciones sexuales durante el embarazo suelen ser seguras si tienes un embarazo sano y normal, y si tanto tú como tu pareja os sentís preparados. No le harás daño a tu bebé: el saco amniótico y los músculos del útero lo mantienen protegido. Es posible que tu deseo sexual sufra altibajos durante el embarazo. Algunas futuras mamás afirman tener un mayor deseo sexual este trimestre, ya que han recuperado los niveles de energía que tenían en la primera etapa del embarazo. Ver algunas manchas de sangre o tener calambres leves después de mantener relaciones sexuales puede ser normal, pero visita a tu médico si tienes un sangrado abundante o calambres persistentes.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 20, 'Empieza a organizar la habitación de tu bebé y piensa qué cambios hay que hacer en ella para adaptarla a las nuevas necesidades. Si va a compartir espacio con su hermano, infórmate y busca consejos sobre cómo crear un dormitorio para dos.');
/*---------------------------------------WEEK 23-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 21, 'Fíjate en la cantidad de sal que hay en tu dieta y asegúrate de moderar el consumo de alimentos salados. Los expertos recomiendan no consumir más de una cucharadita de sal al día, así que evita los alimentos con un alto contenido en sodio, como las carnes procesadas y las sopas de sobre.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 21, 'Es importante que intentes evitar posibles intoxicaciones alimentarias y que reconozcas sus signos a tiempo, ya que este tipo de enfermedades puede ser peligroso para tu bebé. Generalmente, entre los signos de una intoxicación alimentaria se encuentran los vómitos, la diarrea, la fiebre, los escalofríos, los dolores y los calambres abdominales. Si crees que tienes una intoxicación alimentaria, visita a tu médico de inmediato para que te trate.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 21, 'Si tu tensión arterial es demasiado alta, tu médico puede sospechar que haya preeclampsia, una complicación del embarazo que se caracteriza por una tensión arterial alta, edema (hinchazón) y proteínas en la orina. Aunque esta enfermedad es más frecuente en el tercer trimestre, puede darse en cualquier momento después de la semana 20 de embarazo y es crucial detectarla a tiempo. Para diagnosticar la preeclampsia, tu médico comprobará tu tensión arterial y analizará los niveles de proteínas de tu orina. Si notas algunos de los síntomas de la preeclampsia (problemas de visión como ver manchas, dolor de cabeza persistente, hinchazón repentina en los pies y las manos, náuseas, aumento repentino de peso o problemas para respirar), visita a tu médico inmediatamente. Si no se trata, la preeclampsia puede provocar una disminución del flujo sanguíneo que llega a la placenta y afectar a los riñones, el hígado, el cerebro y los ojos.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 21, 'Echa un vistazo a los signos de parto prematuro, ¡por si acaso! Un parto prematuro se produce cuando el trabajo de parto se inicia antes de que finalice la semana 37 de embarazo. Si tu médico reconoce con suficiente antelación que te has puesto de parto, puede posponer el nacimiento de tu bebé. De esta forma, tu bebé seguirá un tiempo en el útero y podrá crecer y desarrollarse aún más. Esta es la razón por la que debes estar pendiente de las señales de parto y avisar a tu médico de inmediato si crees que las estás sintiendo. Estas señales son: dolor de espalda constante; flujo vaginal acuoso, mucoso o con sangre; presión en la pelvis; calambres abdominales; diarrea; contracciones regulares; y rotura de aguas.');
/*---------------------------------------WEEK 24-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 22, 'Normalmente, la prueba de tolerancia a la glucosa se realiza entre las semanas 24 y 28 de embarazo. Esta prueba ayudará al médico a evaluar el riesgo de que padezcas diabetes gestacional. El médico te aconsejará si debes realizarte esa prueba.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 22, 'A medida que tu vientre aumente de tamaño, tendrás que hacer ciertos ajustes en tu rutina diaria como, por ejemplo, la forma en que te abrochas el cinturón de seguridad para protegeros a ti y a tu bebé. La correa inferior del cinturón de seguridad debe colocarse por debajo del vientre apoyada cómodamente sobre los huesos de la cadera. Sitúa la correa superior en el centro del pecho, no debajo del brazo. Evita siempre colocar el cinturón de seguridad por encima del vientre.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 22, 'Es importante que te mantengas hidratada, aunque a muchas personas les cuesta beber lo necesario al día. Como futura mamá, necesitas mucha agua para mantenerte sana y ayudar a tu bebé a crecer. Los expertos recomiendan beber unos 10 vasos de líquido al día. La mayor parte de líquido que ingieras debe ser agua, pero también puedes tomar zumo o café de vez en cuando. Si normalmente se te olvida beber durante tu ajetreado día, configura un recordatorio en el teléfono que te avise de que tienes que beber un vaso de agua cada pocas horas. Descárgate una aplicación de hidratación que haga un seguimiento de tu ingesta y te recuerde si te quedas atrás, o proponte beber un número determinado de botellas de agua al comenzar el día y anímate a terminártelas todas.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 22, 'Puede ser buena idea empezar a hablar sobre tus preferencias para el parto con tu médico, tu matrona o la persona que te acompañará en ese momento. Tu compañero de parto puede ser tu pareja, un amigo de confianza o un ser querido. Cuanto más sepan tu médico y la persona que te acompañará sobre tus preferencias personales y el tipo de parto que te gustaría tener, mejor podrán apoyarte cuando llegue el momento. La persona que te acompañe puede apoyarte para que te sientas más cómoda con masajes, y ofreciéndote mucho ánimo y apoyo emocional. Todavía queda tiempo para mantener estas conversaciones y, si así lo decides, redactar un plan de parto, pero ya es buen momento para tratar el tema.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 22, 'Puede que estés sintiendo cosas extrañas que no seas capaz de identificar. Tal vez tengas sueños raros o te cueste mantener la concentración cuando normalmente estás muy atenta a todo.');
/*---------------------------------------WEEK 25-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 23, '¿Has pensado si quieres utilizar algún tratamiento para el dolor durante el parto? Existen numerosas opciones, como fármacos analgésicos y anestesia e incluso otros métodos de alivio sin fármacos. Pregúntale a tu médico qué opciones tienes y ten en cuenta que siempre podrás cambiar de opinión más adelante.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 23, 'Es posible que algunos amigos o incluso desconocidos te hagan comentarios bienintencionados al verte la barriga de embarazada. No te sientas obligada a responder y ofrecer detalles sobre tu embarazo, como el tamaño de tu vientre a las 25 semanas, el peso, los hábitos de alimentación y el ejercicio, ya que eso solo es cosa tuya y del médico. Si esas preguntas o comentarios te hacen sentir incómoda, puedes responder con un simple «gracias por tu interés».');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 23, 'Si los dolores y las molestias te desaniman, considera la posibilidad de realizar cambios en tu rutina de ejercicios. Tener a mano una herramienta como una pelota de ejercicios es genial para hacer ejercicio durante el embarazo, ya que te ayudará a estirar y tonificar la espalda, los brazos y los hombros, entre otras partes de tu cuerpo. Pídele consejo a tu médico sobre qué ejercicios fáciles y seguros puedes hacer con la pelota. Algunas futuras mamás creen que los ejercicios suaves de yoga también ayudan con las molestias.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 23, 'Si aún no lo has hecho, apúntate a una clase para padres en la que expliquen los cuidados que necesita un recién nacido. Una de las cosas más importantes que debes aprender es cómo dormir a tu bebé para reducir el riesgo de síndrome de muerte súbita del lactante (SMSL). Para empezar, el bebé debe estar siempre boca arriba, sobre una superficie firme y sin mantas ni juguetes en la cuna.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 23, 'En Internet puedes consultar las opiniones de algunos de los productos para bebés en los que estás interesada o que ya has adquirido. Puedes preguntar a otras personas para saber cuáles son sus productos favoritos, desde asientos para el coche hasta cochecitos... ¡O incluso el mejor biberón! Consulta varios artículos con opiniones y recomendaciones de productos.');
/*---------------------------------------WEEK 26-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 24, 'Algunas futuras mamás recurren a la ayuda de una doula, que puede actuar como asistente profesional durante el parto y dar apoyo durante el posparto. Aunque no sustituyen a los médicos, las enfermeras ni otros profesionales sanitarios, las doulas pueden ofrecerte apoyo emocional, ayudarte a comunicarte de forma eficaz con el personal del hospital e incluso ayudarte a iniciar la lactancia después del parto. Si te interesa contar con una doula, pídele recomendaciones a tu médico o al instructor de tu clase de preparación para el parto (y a tus compañeros de clase).');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 24, 'Tal vez quieras crear un plan de parto que te ayude a definir lo que te gustaría que ocurriese durante el mismo y compartir tus preferencias con tu pareja y el personal del hospital. Lo que decidas incluir depende de ti, pero es una buena idea consultar al médico a la hora de redactarlo, ya que podrá darte recomendaciones muy útiles y sabrá qué puedes utilizar y qué es lo más apropiado para tu situación particular. No es obligatorio tener un plan de parto y, aunque lo tengas, es importante ser flexible. Es probable que el nacimiento de tu bebé no vaya exactamente según lo previsto. Si estás interesada en redactar un plan de parto y te gustaría inspirarte para decidir qué incluir, puedes descargar varias plantillas de Internet. Una vez que hayas terminado el plan de parto, imprime varias copias para el personal del hospital y para la persona que te acompañará durante el parto.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 24, 'Vigila la ingesta de líquidos y fibra. Beber entre seis y ocho vasos de agua al día te ayuda a mantenerte hidratada, mejora la digestión y ayuda a evitar las infecciones de orina y vejiga. También ayuda a garantizar que tu bebé recibe los nutrientes que necesita mientras crece. Por otro lado, consumir suficiente fibra (25 g diarios) puede ayudarte a evitar el estreñimiento y a reducir el riesgo de padecer diabetes y enfermedades cardíacas. Si necesitas aumentar el consumo de fibra, incorpora a tu dieta alimentos como plátanos, pastas integrales, lentejas y manzanas. Un plátano contiene unos tres gramos de fibra y una taza de pasta integral aporta unos seis gramos, lo que los convierte en grandes fuentes de fibra.');
/*---------------------------------------WEEK 27-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 25, '¿Cómo va tu rutina de ejercicios? Si buscas otra forma de moverte, plantéate la posibilidad de incluir la natación entre tus actividades habituales, sobre todo en la semana 27 de embarazo, cuando el vientre sigue creciendo. La natación ofrece un gran entrenamiento cardiovascular, es más suave para las articulaciones que otras formas de ejercicio y puede ayudar a aliviar los dolores y las molestias que tengas. Si estás embarazada durante los calurosos meses de verano, la natación puede ser una forma estupenda de mantenerte hidratada cuando te sientas menos cómoda.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 25, 'Ahora es el momento de informar a tu médico si quieres extraer y almacenar la sangre del cordón umbilical de tu bebé. La sangre del cordón umbilical se recoge del cordón y la placenta después del nacimiento y contiene células madre que pueden utilizarse para tratar determinadas enfermedades. Es posible que reúnas los requisitos para donar la sangre del cordón umbilical a un banco público, en cuyo caso la sangre del cordón de tu bebé estaría disponible para cualquier persona que se considere compatible, de forma similar a un banco de sangre. Otra opción es almacenar la sangre del cordón umbilical del bebé en un banco privado, que cobra por la extracción y el almacenamiento. Ten en cuenta que es muy poco probable que la sangre del cordón umbilical de tu bebé sea eficaz para tratar cualquier enfermedad o afección que él o cualquier familiar directo pueda tener. Tu médico podrá ofrecerte más información sobre el almacenamiento de la sangre del cordón umbilical y las opciones disponibles.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 25, 'Si los análisis de sangre preliminares indican que tu Rh es negativo, es posible que tu médico te administre una inyección de inmunoglobulina Rh entre las semanas 24 y 28 de embarazo, en caso de que el Rh de tu bebé sea positivo. Esto evitará que tu cuerpo produzca anticuerpos contra cualquier célula de la sangre del bebé que pueda haber accedido a tu circulación. Se le realizará una prueba al bebé justo al nacer. Si su Rh es positivo, se te administrará otra inyección de inmunoglobulina Rh como protección en caso de futuros embarazos.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 25, 'En caso de sentir el síndrome del nido, puedes aprovechar este periodo para hacer algunas cosas en casa, como organizar los armarios, escribir una lista con las pequeñas cosas que hay que arreglar o empezar a adaptar la casa para garantizar la seguridad del bebé. No obstante, no debes excederte: dedica siempre tiempo a descansar y pide ayuda para cualquier cosa que pueda resultarte peligrosa en este momento, como subir una escalera.');
/*---------------------------------------WEEK 28-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 26, 'Es posible que el médico te indique que la semana 28 de embarazo es un buen momento para empezar a "contar las patadas" de tu bebé. A continuación te explicamos una forma de hacerlo: siéntate en un lugar cómodo con las manos sobre el abdomen. Comprueba la hora a la que empiezas y espera hasta sentir 10 patadas, revolcones u otros movimientos. Asegúrate de que estás contando movimientos fetales buenos y fuertes, y no el hipo del bebé, por ejemplo. Si no sientes al menos 10 movimientos en dos horas en la semana 28 de embarazo, habla con tu médico. Si no sientes muchos movimientos, es posible que tu bebé esté durmiendo. Suele ser útil elegir un momento del día en el que esté más activo, como después de comer.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 26, '¿Practicas tus ejercicios de Kegel? Nunca es demasiado tarde para empezar. Si tienes problemas de pérdidas de orina, los ejercicios de Kegel son una forma estupenda de fortalecer los músculos del suelo pélvico y mejorar el control de la vejiga. Algunas futuras mamás perciben que tienen pérdidas de orina después del parto, y los ejercicios de Kegel pueden hacer que estos músculos pélvicos se fortalezcan y vuelvan a la normalidad.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 26, 'Piensa en el tipo de anticonceptivo que querrás utilizar después del nacimiento de tu bebé y consulta las opciones con el médico. Las píldoras anticonceptivas hormonales que contienen estrógenos pueden no ser adecuadas para la lactancia, así que habla con tu médico, quien podrá darte consejos específicos.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 26, 'A medida que tu barriga vaya creciendo, puedes preguntar al médico sobre qué posturas son más cómodas y seguras para dormir. También puedes comprar una almohada para embarazadas que te sirva para apoyar el cuerpo de forma adecuada.');
/*---------------------------------------WEEK 29-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 27, 'Si te sientes un poco estresada en estos momentos, quizás te apetezca probar algunas técnicas de relajación. Aunque es normal que haya algo de estrés debido al embarazo, no deberías sentirte así a diario. Dos buenas opciones son el yoga prenatal y la meditación. El médico puede darte más información sobre cómo practicarlos de forma segura durante el último trimestre. Aprender a relajar el cuerpo y la mente durante la semana 29 de embarazo te ayudará a reducir la tensión arterial o muscular y aliviar el dolor lumbar. Te sentirás más cómoda durante los meses que quedan hasta dar a luz. Otros métodos para combatir el estrés son recibir un masaje, escribir en un diario o escuchar tu música favorita mientras descansas.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 27, 'Existen varios métodos de preparación al parto que, según los expertos, son muy útiles. Entre ellos, se encuentran el método Lamaze, el método Bradley y el método Read. Es posible que quieras obtener más información sobre ellos, ya que pueden ayudarte a controlar el dolor y la ansiedad durante el parto mediante técnicas de relajación y respiración.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 27, '¿Sabes ya dónde darás a luz? Si es así, es posible que tu hospital o clínica de maternidad te permitan hacer una visita a sus instalaciones antes de la fecha de parto. Además, puedes aprovechar para calcular la ruta más rápida y comprobar el aparcamiento y las entradas. Durante la visita puedes preguntar las normas al personal del hospital, como quién puede entrar en la sala de partos y si está permitido hacer fotografías o vídeos.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 27, 'Piensa cómo vais a gestionar el cuidado del bebé, sobre todo si tu pareja y tú vais a volver a trabajar. Hay varias opciones, desde guarderías hasta el cuidado en el hogar. Cada una de ellas tiene sus propios costes y condiciones de disponibilidad, por lo que es mejor investigar y hacer los ajustes necesarios antes de que llegue tu pequeño. Así tendrás una cosa menos por la que preocuparte cuando comiences a cuidar de él. Si este no es tu primer hijo, es posible que quieras organizar el cuidado de los mayores cuando te pongas de parto o durante los primeros días de vida del bebé.');
/*---------------------------------------WEEK 30-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 28, 'Al igual que en cualquier otro momento del embarazo, es importante seguir una dieta equilibrada para que el bebé crezca sano y fuerte. Uno de los nutrientes esenciales es el calcio, que contribuye a la formación de los huesos y dientes de tu pequeño. Debes tomar 1000 mg de calcio al día. Si no obtienes suficiente calcio de los alimentos que comes, el médico puede recomendarte suplementos. Los lácteos, los cereales y zumos enriquecidos, las almendras y las verduras de hoja oscura son grandes fuentes de calcio.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 28, 'Sentir la misma cantidad de movimientos del bebé de un día para otro puede ser una señal de que todo va bien. Algunos expertos recomiendan contar las patadas a partir de la semana 30 de embarazo. Pregunta al médico cuándo debes empezar, ya que la situación de cada persona es diferente. También podrá indicarte cómo hacer estos recuentos. Una forma es buscar un momento del día en el que el bebé esté más activo y contar el número de patadas o movimientos que notas en un periodo de dos horas. Hay muchas herramientas en Internet que pueden ayudarte. Ten en cuenta que, si notas menos movimientos que de costumbre, no significa que algo vaya mal. De hecho, puede que tu hijo esté dormido. Consulta al médico si tienes alguna duda o preocupación.');
/*---------------------------------------WEEK 31-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 29, 'Quizás te preguntes si es seguro mantener relaciones sexuales durante el embarazo. Si no hay nada raro y tanto tú como tu pareja os sentís cómodos, es seguro practicar sexo incluso en el tercer trimestre. Encontrar una postura cómoda puede llevar un poco de tiempo. Experimenta y descubre lo que te funciona. Consulta al médico si te preocupa mantener relaciones sexuales o tienes alguna duda.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 29, 'Ahora puede ser un buen momento para empezar a pensar si vas a dar el pecho o utilizar leche artificial. Comenta tu elección al médico o la asesora de lactancia y pregunta cualquier duda que tengas. Si vas a dar el pecho, podrías asistir a clases de lactancia. Si no estás segura, el médico puede explicarte qué productos necesitas, como un sacaleches o biberones, así como dónde comprarlos. Si piensas alimentar al bebé con leche artificial, también puedes pedirle consejo sobre qué leche es la mejor en tu caso. Todavía tienes tiempo para decidirlo. De hecho, muchas madres escogen una opción una vez que ha nacido su pequeño, pero no está de más reflexionar sobre este tema.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 29, 'Busca información sobre cómo prepararte para un parto natural (es decir, un parto sin apenas intervención médica) en caso de querer llevarlo a cabo. Si te llama la atención y el médico también cree que puede ser una buena opción para ti, debes pensar en opciones alternativas para aliviar el dolor y el apoyo que quieres recibir al dar a luz.');
/*---------------------------------------WEEK 32-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 30, 'Presta atención a algunos síntomas como aumento repentino de peso, dolores de cabeza persistentes, cambios en la visión, dolor en la parte superior del abdomen o los hombros e hinchazón. Podrían ser señal de un trastorno de hipertensión arterial relacionado con el embarazo llamado preeclampsia. Si notas alguno de estos síntomas en la semana 32 de embarazo o cualquier momento, consulta al médico inmediatamente.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 30, 'Si crees que puedes estar de parto prematuro, consulta al médico inmediatamente. Puede sugerirte métodos que te ayuden a evitar esta situación, como el reposo en cama y la ingesta de líquidos o medicamentos para detener las contracciones. En algunos casos, es recomendable permanecer en el hospital.');
/*---------------------------------------WEEK 33-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 31, 'Dado que se acerca la fecha de parto, es posible que quieras investigar algunas posturas que pueden ayudarte a dar a luz de una forma más cómoda. Infórmate sobre las opciones que tienes a tu disposición, como sillas, taburetes, pelotas de parto o bañeras. Consulta al médico para saber qué te ofrece el hospital o clínica de maternidad. Naturalmente, no sabrás qué te hará sentir más cómoda hasta que estés de parto, pero tómate un tiempo para estudiarlo todo.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 31, '¿Has preparado la bolsa del hospital? Investiga qué cosas debes llevarte y asegurate de que has preparado todo lo que tú, tu pareja y el bebé necesitaréis mientras estéis allí.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 31, 'Si tienes más hijos, piensa en quién se ocupará de ellos mientras estés de parto y durante tu estancia en el hospital. Considera la posibilidad de pedírselo a un familiar o contratar a una canguro que pueda estar disponible con poca antelación.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 31, 'Si te desplazas en coche, necesitarás una sillita homologada cuando el bebé llegue. Tiene que estar orientada hacia atrás y montarse correctamente en el asiento trasero del vehículo.');
/*---------------------------------------WEEK 34-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 32, 'El calcio contribuye a la formación de los huesos y dientes del bebé, por lo que debes asegurarte de tomar una cantidad suficiente. Las vitaminas prenatales contienen calcio, pero también debes comer alimentos que sean ricos en este mineral. Algunos ejemplos son los productos lácteos (por ejemplo, leche, queso y yogur), las sardinas, las verduras de hoja verde y los zumos con extra de calcio. No te preocupes si eres intolerante a la lactosa, ya que hay muchísimas opciones. Sigue leyendo sobre la función del calcio y el hierro en el embarazo y pregunta al médico si estás recibiendo la cantidad adecuada. Te recomendará un suplemento si lo considera necesario o introducirá cambios en tu dieta.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 32, 'Si tienes tiempo esta semana, considera llenar la despensa y preparar platos que puedas congelar. Hacer estas cosas con antelación te ahorrará quehaceres cuando estés ocupada cuidando al recién nacido. También es posible que quieras programar un pedido en tu supermercado habitual o hablar con amigos y familiares para que te lleven comida casera durante las semanas posteriores al parto.');
/*---------------------------------------WEEK 35-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 33, 'Has pasado mucho tiempo con tu hijo mientras crecía en la tripa, pero vuestro vínculo será aún más fuerte cuando lo tengas en brazos. Ten en cuenta que el vínculo afectivo no es un acontecimiento único, ya que desarrolla a lo largo del tiempo a medida que vas conociendo a tu pequeño. Es posible que esta conexión no sea tan fuerte como esperabas justo después de dar a luz. Tienes muchas cosas en la cabeza y adaptarte a la maternidad no siempre es fácil. Con el tiempo, el vínculo entre tu bebé y tú hará que quieras protegerlo y darle todo tu amor. Si tienes dudas sobre cómo te sientes, ya sea ahora o después del nacimiento, habla con el médico y tus seres queridos.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 33, 'En esta fase del embarazo es probable que tengas citas médicas cada dos semanas. Tu médico comprobará los aspectos habituales, pero en algún punto entre este momento y la semana 37 puede hacerte una prueba para detectar la bacteria del estreptococo grupo B. Esta bacteria suele ser inofensiva para los adultos, pero, si los recién nacidos se infectan durante el parto, puede causar enfermedades. Para detectarla el médico tomará muestras de la vagina y el recto con un hisopo. Si el resultado es positivo, es probable que se te administren antibióticos durante el parto para reducir la posibilidad de que el bebé se infecte.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 33, 'La preeclampsia es un trastorno grave de la tensión arterial que puede aparecer después de la semana 20 de embarazo, en el tercer trimestre o después del parto. Algunos síntomas de la preeclampsia son dolor de cabeza persistente, cambios en la vista, dificultad para respirar o dolor en la parte superior del abdomen y los hombros.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 33, 'Queda poco para que nazca el bebé, así que te recomendamos regalarte un tiempo para ti. Aprovecha esta oportunidad para hacer cosas que te sienten bien, como tener una cita especial con tu pareja o ponerte al día con tus amigos.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 33, 'Si aún no lo has hecho, busca un pediatra para el bebé. Pide consejo al médico o la matrona sobre cómo encontrar el adecuado. Otros padres de la zona también pueden recomendarte uno.');
/*---------------------------------------WEEK 36-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 34, 'Asegúrate de consumir al menos 85 mg de vitamina C en tu dieta cada día para fortalecer el sistema inmunitario, los huesos y los músculos. Los cítricos, las fresas, el brócoli y los tomates son fuentes de este nutriente. Una naranja de tamaño medio puede contener hasta 70 mg y un vaso de zumo de naranja puede contener más de 90 mg. Si estás tomando vitaminas prenatales, estas pueden contener una cantidad suficiente. El médico podrá decirte si estás ingiriendo suficiente vitamina C.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 34, 'El ejercicio suave puede ayudarte a estar más cómoda durante estas últimas semanas de embarazo. Sal a caminar y haz estiramientos para aliviar la presión sobre la espalda. Flexiónate hacia adelante estando de pie para reducir el dolor lumbar a las 36 semanas de embarazo. Repite estas flexiones según sea necesario.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 34, 'Aprovecha el «síndrome del nido» para preparar tu casa antes de la llegada del bebé. Algunas madres aprovechan esta explosión de energía para ultimar proyectos de última hora, decorar la habitación del bebé o comprar algunos artículos. Intenta no agotarte y pide ayuda cuando la necesites.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 34, 'En algún punto de las últimas semanas de embarazo el médico intentará determinar la posición del bebé dentro del útero. Es posible que puedas averiguarlo tú misma palpando el contorno a través del abdomen. Si el bebé está de nalgas (con los pies hacia abajo), el médico puede sugerirte realizar una ecografía en la semana 36 de embarazo para saberlo con seguridad. Ten en cuenta que todavía quedan varias semanas para que el bebé cambie de posición, pero el médico vigilará su posición antes del parto para mayor seguridad.');
/*---------------------------------------WEEK 37-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 35, 'Investiga opciones para alimentar al bebé. Puedes optar por la lactancia materna o la leche de fórmula, pero infórmate antes sobre las ventajas e inconvenientes de cada una. Consulta al médico o una asesora de lactancia para obtener más información.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 35, 'Pide a tus seres queridos que hagan tareas como ir al supermercado, lavar la ropa o cuidar de tus hijos mayores y mascotas durante las primeras semanas de vida del recién nacido. Haz una lista de las cosas en las que pueden ayudarte para que sepan exactamente qué es lo que necesitas.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 35, 'Recuerda que esta semana el embarazo ha llegado a término temprano. Por lo general, suele ser al principio de la semana 39. El bebé aún debe desarrollarse en muchos aspectos, pero apenas te quedan unas semanas para conocerle.');
/*---------------------------------------WEEK 38-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 36, '¿Has considerado todas las opciones para el parto y los analgésicos suelen disminuir el dolor? Si no es así, consulta al médico. Los analgésicos suelen disminuir el dolor, pero no lo eliminan, mientras que los anestésicos bloquean la sensación. Una opción muy popular es la epidural, pero te recomendamos consultar al médico para saber cuál es la opción más adecuada según tu situación. Si has asistido a clases prenatales, es probable que te enseñasen varias técnicas, como los métodos Lamaze, Bradley y Read. Considera todas las opciones y comenta tus preferencias con el médico.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 36, 'Investiga las políticas sobre alimentación y bebida durante el parto. Si van a practicarte una cesárea, deberás ayunar antes de la intervención. El médico te dará más información sobre el tiempo de ayuno. En el caso de un parto vaginal, normalmente te dejarán beber durante el parto, pero no comer. Consulta al médico o el personal del hospital con antelación para estar segura.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 36, 'Si vas a dar el pecho a tu hijo, quizás quieras buscar ayuda. Una asesora de lactancia te ayudará a familiarizarte con las dificultades asociadas a esta práctica, como el agarre o el dolor en los pezones. Puedes buscar en Internet, preguntar al médico y la matrona o pedir consejo a tus amigas.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 36, 'Dedica un tiempo esta semana a leer sobre el posparto. Saber lo que te espera te hará sentir más preparada.');
/*---------------------------------------WEEK 39-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 37, 'Si crees que puedes estar de parto, comienza a medir las contracciones para asegurarte de que no son contracciones de Braxton Hicks. En las primeras fases del parto tendrás contracciones en intervalos de 5 a 15 minutos, y cada una de ellas durará entre 60 y 90 segundos. Si son regulares y no desaparecen al cambiar de posición, llama al médico. A medida que avanza el parto, las contracciones son más frecuentes y aumentan de intensidad.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 37, 'En algunos casos, el médico puede recomendar inducir el parto porque el bebé o la madre tengan alguna enfermedad, el parto no avance como debería o se haya superado la fecha prevista. El médico te explicará el procedimiento, los riesgos y las ventajas según tu situación de ser necesario, aunque no sea lo que habías planeado.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 37, 'Durante el parto descubrirás que algunas posiciones son más cómodas que otras. Por ejemplo, algunas madres dan a luz en una cama apoyando los pies en los estribos, mientras que otras usan una silla de parto o un taburete en caso de que el hospital o la clínica de maternidad lo permitan. Si tienes la opción, puedes solicitar una pelota para balancearte hacia adelante y hacia atrás cuando tengas contracciones. También puedes ponerte en cuclillas, levantarte o arrodillarte si el personal del hospital lo autoriza. Quizás hayas redactado un plan de parto para indicar cómo quieres que se desarrolle y algunas técnicas para sentirte más cómoda. No obstante, tus preferencias pueden cambiar durante el parto, por lo que debes ser flexible.');
/*---------------------------------------WEEK 40-----------------------------------*/
INSERT INTO advice (week_id, advice_description)
        VALUES ( 38, 'No te sorprendas si tu bebé no llega exactamente en la fecha de parto prevista. De hecho, no se considerará un embarazo a término tardío hasta que llegues a las 42 semanas. Recuerda que solo es una estimación. Si das a luz un poco más tarde de lo esperado, puede deberse a que tu bebé solo quiere estar un poco más de tiempo en la tripa.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 38, 'Durante las últimas semanas de embarazo probablemente visitarás al médico una vez a la semana. En estas visitas revisarán el cuello uterino y los movimientos del bebé. Si no te has puesto de parto en la semana 41 o 42, el médico podría elaborar un plan para inducir el parto. Después de las 40 semanas de embarazo, la cantidad de líquido amniótico en el útero empieza a disminuir y la placenta no nutre ni protege al bebé como antes. Intenta no preocuparte, ya que el médico os está vigilando de cerca tanto a ti como a él y sabrá cuál es la mejor forma de actuar. Si te pones de parto, pero este no avanza con normalidad, también puede inducir el parto o sugerirte otro método para que se produzca algún progreso.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 38, 'Aunque estés deseando recibir a tu bebé, considera estos últimos días como una oportunidad para darte un capricho. Si estás embarazada de 40 semanas y no tienes señales de parto, ¿por qué no te haces la pedicura, ves una película o lees un libro? También puedes aprovechar este tiempo para dormir hasta tarde y echarte alguna que otra siesta. Una vez que nazca el bebé, estarás de guardia las 24 horas del día y pasará un tiempo antes de que puedas sacar tiempo para ti.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 38, 'Cuando llegue el momento, deja que tu acompañante te ofrezca su apoyo. Puede hacerte compañía, ayudarte a medir las contracciones y darte un masaje relajante que te ayude a olvidar cualquier dolor o molestia. Tal vez quieras aprovechar este momento para hablar de algunos temas más complejos, como quién cortará el cordón umbilical.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 38, 'Es probable que el médico haya controlado el aumento de peso a lo largo del embarazo. La mayor parte de este peso procede de tus propias reservas de grasa, el peso corporal de tu bebé y el volumen adicional de sangre y líquidos. Perderás la mayor parte del peso que hayas ganado durante el embarazo una vez que haya nacido tu hijo. Existen muchos recursos en Internet que puedes leer si quieres obtener más información sobre la pérdida de peso después del parto. Ten en cuenta que tendrás mucho que hacer cuando llegue tu recién nacido, así que tómate las cosas con calma y trata de no presionarte demasiado.');
INSERT INTO advice (week_id, advice_description)
        VALUES ( 38, 'Leer con antelación sobre lo que sucederá durante el parto y el posparto puede ayudarte a sentirte más preparada.');

