const jwt = require('jsonwebtoken');

module.exports = () => {
    return (req, res, next) => {
        try {
            const token = req.headers.authorization.split(" ")[1];
            const verified = jwt.verify(token, process.env.TOKEN_SECRET);
            if (verified.role) {
                req.user = verified;
                next();
            } else {
                res.json({ Error: 'UnAuthrized User' });
            }
        } catch (error) {
            res.json({ Error: 'Token is Invalid....' });
        }
    }
}