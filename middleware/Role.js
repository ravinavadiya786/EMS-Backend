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
                res.status(501).json({ Error: 'UnAuthrized User' });    // do not chnages the satus code
            }
        } catch (error) {
            res.status(501).json({ Error: 'Token is Invalid....' });  // do not chnages the satus code
        }
    }
}