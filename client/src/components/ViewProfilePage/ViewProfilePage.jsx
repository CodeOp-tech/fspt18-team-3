import React, { useEffect, useState, useParams } from "react";
import logo_babybump from "../../assets/logo_babybump.png";
import "./ViewProfilePage.css"
import img1 from "../../images/img1.jpg"
import img2 from "../../images/img2.jpg"
import img3 from "../../images/img3.jpg"

 const ViewProfilePage = () =>{
    //const {user_id} = useParams()
    /*const [user, setUser] = useState({
        "id": 1, 
        "user_name": "Pepita",    
        "mail": "hello@gmail.com",
        "user_password": "123",
        "baby_name": "Manolito",
        "creation_date": "2023-09-13",
        "weeks_pregnant": 13,
        "photo_url": "https://res.cloudinary.com/dgv68zde9/image/upload/v1695065159/Pregnancy/Semana%203.jpg"
     })*/
    const [user, setUser] = useState("")
    const [images, setImages] = useState([{
        "id": 1,
        "image": img1,
    },
    {
        "id": 2,
        "image": img2,
    },
    {
        "id": 3,
        "image": img3,
    },])
    const [error, setError] = useState("")

    useEffect(()=>{
        getUser()
    },[/*user_id*/])

    const getUser = async () => {
        fetch(`http://localhost:5000/users/user/1`)//----->${user.id}
        .then(response => response.json())
        .then(user =>
            setUser(user[0]),
            console.log(user))
        .catch(err =>
            setError(err))
    }

    const countWeeks = (user) =>{
        const dateToday = new Date().toISOString().slice(0,10);
        const simpleDate = new Date(dateToday)
        const creationDate = new Date(user.creation_date)
        
        const weeksAdded = (simpleDate-creationDate)/(1000*60*60*24*7)

        const result = weeksAdded + user.weeks_pregnant
        
       return  Math.round(result)
    }

    const countWeeksLeft = (user) =>{
        return 40 - countWeeks(user)
    }

    return <div>
        <div className="profile-text">
            <div className="profile-logo-image__text">
                <div className="profile-logo"><img src={logo_babybump}></img></div>
                <div className="profile-photo"><img src={user.photo_url}></img></div>
            </div>
            <div className="profile-info">
                <h2>{user.user_name}</h2>
                <p>Tu bebé ya tiene {countWeeks(user)} semanas.</p>
                <p>Quedan aproximadamente {countWeeksLeft(user)} para tu parto.</p>
            </div>
            <div className="profile-buttons">
                <button type="button">Saber más sobre mi embarazo</button>
                <button type="button">Editar</button>
            </div>
        </div>
        <div className="profile-galery">
            <h3>Galería de mi embarazo</h3>
            <div className="profile-grid">
                {images.map(image => (
                    <div className="profile-grid-item" key={image.id}>
                        <img src={image.image}></img>
                    </div>
                ))}
            </div>
            <button type="button">Añade otra imagen</button>
        </div>
    </div>
}

export default ViewProfilePage;