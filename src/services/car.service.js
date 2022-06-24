const Car = require("../models/car");

/* 
C - insert - create
R - select - find*
U - update - update
D - delete - destroy

*/

module.exports.createCar = async (data) => {
  const newCar = await Car.create(data);

  return newCar;
};

module.exports.getCarList = async (limit, page) => {
  const foundCars = await Car.findAll({
    limit: limit,
    offset: (page - 1) * limit,
  });

  return foundCars;
};

const getCarById = async (carId) => {
  // 1
  // const foundCars = await Car.findAll({
  //   where: {
  //     id: carId,
  //   },
  //   limit: 1,
  // });

  // 2
  /* const foundCar = await Car.findOne({
    where: {
      id: carId,
    }
  }); */

  // 3
  const car = await Car.findByPk(carId);

  if (!car) {
    throw new Error("Car not found");
  }

  return car;
};
module.exports.getCarById = getCarById;

module.exports.updateCarById = async (id, data) => {
  // 1
  // await Car.update(data, {
  //   where: {
  //     id,
  //   }
  // });
  // const updatedCar = await getCarById(id);

  // 2
  const updatedCar = await getCarById(id);

  if (!updatedCar) {
    throw new Error("Car not found");
  }

  await updatedCar.update(data);

  return updatedCar;
};

module.exports.deleteCarById = async (id) => {
  // 1
  // const deletedCount = await Car.destroy({ where: { id } });
  // if (deletedCount === 0) {
  //   throw new Error('Car not found');
  // }

  // 2
  const deletedCar = await getCarById(id);
  if (!deletedCar) {
    throw new Error("Car not found");
  }
  await deletedCar.destroy();

  return deletedCar;
};
