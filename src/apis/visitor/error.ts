import { BadRequestError, ServerError } from '../../service/error';
import { Response } from 'express';

function errorResposne(err: unknown, res: Response) {
  if (err instanceof ServerError) {
    console.error(err);
    return res.status(500).json({ msg: err.message });
  } else if (err instanceof BadRequestError) {
    console.error(err);
    return res.status(404).json({ msg: err.message });
  } else if (err instanceof Error) {
    console.error(err);
    return res.status(500).json({ msg: 'Unknown error' });
  }
}

export default errorResposne;
