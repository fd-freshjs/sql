const { Router } = require("express");

const userRouter = Router();

// all
userRouter.get('/', (req, res, next) => {
  console.log('I am here');

  res.status(200).send({ data: 'I am here' });
});
// by id
userRouter.get('/:id', (req, res, next) => {
  console.log(req.params.id);

  res.status(200).send({ data: Number(req.params.id) });
});

// create
userRouter.post('/');

// update
userRouter.patch('/:id');

// delete
userRouter.delete('/:id');

module.exports = userRouter;
