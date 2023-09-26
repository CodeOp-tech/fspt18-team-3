import React, { useEffect, useState, useParams } from "react";

export const ViewProfilePage = () =>{
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

    const [error, setError] = useState("")

    useEffect(()=>{
        getUser()
    },[/*user_id*/])

    const getUser = async () => {
        fetch(`/user/:1`)//----->${user.id}
        .then(response => response.json())
        .then(user =>
            setUser(user),
            console.log(user))
        .catch(err =>
            setError(err))
    }

    const countWeeks = () =>{
        const dateToday = new Date().toISOString().slice(0,10);
        const simpleDate = new Date(dateToday)
        const creationDate = new Date(user.creation_date)
        
        const weeksAdded = (simpleDate-creationDate)/(1000*60*60*24*7)

        const result = weeksAdded + user.weeks_pregnant
        
       return  Math.round(result)
    }

    const countWeeksLeft = () =>{
        return 40 - countWeeks()
    }

    return <div>
        <div className="profile-text">
            <div className="profile-logo"></div>
            <div className="profile-photo"><img src={user.photo_url}></img></div>
            <div className="profile-info">
                <h2>{user.user_name}</h2>
                <p>Tu bebé ya tiene {countWeeks()} semanas.</p>
                <p>Quedan aproximadamente {countWeeksLeft()} para tu parto.</p>
            </div>
            <div>
                <button type="button">Saber más sobre mi embarazo</button>
                <button type="button">Editar</button>
            </div>
        </div>
        <div className="profile-galery">
            <h2>Galería de mi embarazo</h2>
            <div className="profile-grid">

            </div>
        </div>
    </div>
}