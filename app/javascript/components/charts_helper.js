const capitalize = (string) => {
  return string.charAt(0).toUpperCase() + string.slice(1);
};

const userArray = (data) => {
  const array = [];
  Object.entries(data['users']).forEach((user) => {
    array.push(capitalize(user[1]['name']));
  });
  return array
};


export {
  userArray
};
