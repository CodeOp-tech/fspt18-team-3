import React, { useEffect, useState, useParams } from "react";

export const ViewProfilePage = () =>{
    const {user_id} = useParams()
    const [user, setUser] = useState("")
    const [error, setError] = useState("")

    useEffect(()=>{
        getUser()
    },[user_id])

    const getUser = () => {
        fetch(`/api/user/${user_id}`)
        .then(response => response.json())
        .then(user =>
            setUser(user[0]))
        .catch(err =>
            setError(err))
    }

    const countWeeks = (weeks) =>{
        const dateToday = new Date().toISOString().slice(0,10);
        const simpleDate = new Date(dateToday)
        //const weeksPregnant = new Date(user.weeks_pregnant)
        
        const weeksAdded = (simpleDate-pillDate)/(1000*60*60*24)

        const result = weeksAdded + user.weeks_pregnant
        
       return  Math.round(result)
    }
    return <div>
        <div className="profile-text">
            <div className="profile-logo"></div>
            <div className="profile-photo"></div>
            <div className="profile-info">
                <h2>{user.user_name}</h2>
                <p>Tu bebé ya tiene {countWeeks(user.weeks_pregnant)} semanas.</p>
                <p>Quedan aproximadamente {user.weeks_pregnant} para tu parto.</p>
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